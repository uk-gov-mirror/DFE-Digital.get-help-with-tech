class CreateUserService
  def self.invite_responsible_body_user(user_params = {})
    user = User.new(user_params.merge(orders_devices: true))
    if user.save
      InviteResponsibleBodyUserMailer.with(user: user).invite_user_email.deliver_later
    end
    user
  end

  def self.invite_school_user(user_params = {})
    if user_exists_on_other_school?(user_params) || user_exists_as_responsible_body_user?(user_params)
      invite_to_additional_school!(user_params)
    else
      create_new_school_user!(user_params)
    end
  end

  def self.user_exists_on_other_school?(user_params)
    user = User.find_by(email_address: user_params[:email_address])
    user && !user.school_ids.empty? && !user.school_ids.include?(user_params[:school_id])
  end

  def self.user_exists_as_responsible_body_user?(user_params)
    User.where(email_address: user_params[:email_address])
        .where.not(responsible_body_id: nil)
        .exists?
  end

  def self.create_new_school_user!(user_params)
    user = User.new(user_params)
    if user.save
      InviteSchoolUserMailer.with(user: user).nominated_contact_email.deliver_later
      user.school.preorder_information&.refresh_status!
    end
    user
  end

  private_class_method :create_new_school_user!

  def self.invite_to_additional_school!(user_params)
    user = User.find_by_email_address(user_params[:email_address])
    school = School.find(user_params[:school_id])
    if user.schools << school
      AddAdditionalSchoolToExistingUserMailer.with(user: user, school: school).additional_school_email.deliver_later
      school.preorder_information&.refresh_status!
      user.update!(user_params.select { |key, _value| user.send(key).blank? })
    end
    user
  end

  private_class_method :invite_to_additional_school!
end
