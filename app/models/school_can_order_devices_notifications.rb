class SchoolCanOrderDevicesNotifications
  attr_reader :school

  def initialize(school: nil)
    @school = school
  end

  def call
    if school&.can_order_devices_right_now?
      notify_about_school_being_able_to_order
      notify_support_if_no_one_to_contact
      notify_computacenter
    end
  end

private

  def notify_about_school_being_able_to_order
    all_relevant_users.each do |user|
      message_type = what_message_to_send(school, user)
      next if message_type.blank?

      notify_user(
        user: user,
        school: school,
        message_type: message_type,
      )
    end
  end

  def notify_support_if_no_one_to_contact
    return if all_relevant_users.present?

    CanOrderDevicesMailer
      .with(school: school)
      .send(:notify_support_school_can_order_but_no_one_contacted)
      .deliver_later
  end

  def all_relevant_users
    school.organisation_users.presence || school.responsible_body.users
  end

  def what_message_to_send(school, user)
    return if school.opted_out?

    if status?(nil, 'needs_contact', school: school) && user.in?(school.responsible_body.users)
      :nudge_rb_to_add_school_contact
    elsif status?('needs_info', 'school_contacted', school: school) && user.in?(school.organisation_users)
      :user_can_order_but_action_needed
    elsif status?('rb_can_order', 'school_can_order', school: school) && user.orders_devices? && !user.seen_privacy_notice?
      :nudge_user_to_read_privacy_policy
    elsif status?('rb_can_order', school: school) && school.responsible_body.has_virtual_cap_feature_flags? && user.in?(school.order_users_with_active_techsource_accounts)
      if school.can_order_routers_only_right_now?
        :user_can_order_routers_in_virtual_cap
      else
        :user_can_order_in_virtual_cap
      end
    elsif status?('ready', 'school_ready', 'rb_can_order', 'school_can_order', school: school) && user.in?(school.order_users_with_active_techsource_accounts)
      if school.responsible_body.new_fe_wave?
        if school.can_order_routers_only_right_now?
          :user_can_order_routers_in_fe_college
        else
          :user_can_order_in_fe_college
        end
      elsif school.can_order_routers_only_right_now?
        :user_can_order_routers
      else
        :user_can_order
      end
    end
  end

  def notify_computacenter
    ComputacenterMailer
      .with(school: school, new_cap_value: new_cap_value)
      .notify_of_school_can_order
      .deliver_later
  end

  def notify_users(users:, school:, message_type:)
    users.each do |user|
      notify_user(user: user, school: school, message_type: message_type)
    end
  end

  def notify_user(user:, school:, message_type:)
    CanOrderDevicesMailer
      .with(user: user, school: school)
      .send(message_type)
      .deliver_later
    EventNotificationsService.broadcast(
      UserCanOrderEvent.new(user: user, school: school, type: message_type),
    )
  end

  def new_cap_value
    school&.std_device_allocation&.cap || 0
  end

  def status?(*statuses, school:)
    school.preorder_information&.status&.in?(statuses)
  end
end
