class ApplicationForm
  include ActiveModel::Model

  attr_accessor :user_id, :user_name, :user_email, :user_organisation
  attr_accessor :full_name,
                :address,
                :postcode,
                :can_access_hotspot,
                :is_account_holder,
                :account_holder_name,
                :device_phone_number,
                :phone_network_name,
                :privacy_statement_sent_to_family,
                :understands_how_pii_will_be_used

  validates :user_name, presence: { message: 'Please tell us your full name, for example Jane Doe' }
  validates :user_email, presence: { message: 'Please tell us your email address, for example j.doe@example.com' }
  validates :user_organisation, presence: { message: 'Please tell us the organisation you work for, for example Lambeth Council' }

  validates :full_name, presence: { message: "Tell us the recipient's full name, like John Smith" }
  validates :address, presence: { message: "Tell us the recipient's address, not including the postcode"}
  validates :postcode, presence: { message: "Enter a postcode, like AA1 1AA" }
  validates :can_access_hotspot, presence: { message: "Tell us whether this young person can access a BT hotspot"}
  validates :is_account_holder, presence: { message: "Tell us whether this young person is the account holder for the mobile device" }
  validates :account_holder_name, presence: { message: "Tell us the full name of the account holder for the mobile device" }, if: :not_account_holder?
  validates :device_phone_number, presence: { message: "Tell us the phone number of the mobile device"}
  validates :phone_network_name, presence: { message: "Tell us the name of the recipients mobile network, for example BT or O2"}
  validates :privacy_statement_sent_to_family, presence: { message: "Please confirm whether this family have received the privacy statement"}
  validates :understands_how_pii_will_be_used, presence: { message: "Please confirm whether this family understand how their personally-identifying information will be used"}


  def initialize(user: nil, recipient: nil, params: {})
    @user = user
    @recipient = recipient
    populate_from_user! if user
    populate_from_recipient! if recipient
    populate_from_params!(params) unless params.empty?
  end

  def save!
    @user ||= construct_user
    @recipient ||= construct_recipient
    validate!
    @user.save!
    @recipient.save!
  end

  def not_account_holder?
    is_account_holder == false
  end

private
  def construct_user
    User.new(full_name: @user_name, email_address: @user_email, organisation: @user_organisation)
  end

  def construct_recipient
    Recipient.new(
      full_name: @full_name,
      address: @address,
      postcode: @postcode,
      can_access_hotspot: @can_access_hotspot,
      is_account_holder: @is_account_holder,
      account_holder_name: @account_holder_name,
      device_phone_number: @device_phone_number,
      phone_network_name: @phone_network_name,
      privacy_statement_sent_to_family: @privacy_statement_sent_to_family,
      understands_how_pii_will_be_used: @understands_how_pii_will_be_used,
    )
  end

  def populate_from_params!(params={})
    params.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def populate_from_user!
    @user_id = @user.id
    @user_name = @user.full_name
    @user_email = @user.email_address
    @user_organisation = @user.organisation
  end

  def populate_from_recipient!
    @full_name = @recipient.full_name
    @address = @recipient.address
    @postcode = @recipient.postcode
    @can_access_hotspot = @recipient.can_access_hotspot
    @is_account_holder = @recipient.is_account_holder
    @account_holder_name = @recipient.account_holder_name
    @device_phone_number = @recipient.device_phone_number
    @phone_network_name = @recipient.phone_network_name
    @privacy_statement_sent_to_family = @recipient.privacy_statement_sent_to_family
    @understands_how_pii_will_be_used = @recipient.understands_how_pii_will_be_used
  end
end
