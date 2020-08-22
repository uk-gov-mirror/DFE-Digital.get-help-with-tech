class PreorderInformation < ApplicationRecord
  self.table_name = 'preorder_information'

  belongs_to :school
  belongs_to :school_contact, optional: true

  validates :status, presence: true

  enum status: {
    needs_contact: 'needs_contact',
    needs_info: 'needs_info',
    ready: 'ready',
    school_will_be_contacted: 'school_will_be_contacted',
    school_contacted: 'school_contacted',
  }

  enum who_will_order_devices: {
    school: 'school',
    responsible_body: 'responsible_body',
  }, _suffix: 'will_order_devices'

  def initialize(*args)
    super
    set_defaults
  end

  # Update this method as we add more fields (e.g. chromebook info)
  # with reference to the prototype:
  # https://github.com/DFE-Digital/increasing-internet-access-prototype/blob/master/app/views/responsible-body/devices/school/_status-tag.html
  def infer_status
    if school_will_order_devices?
      school_contact.present? ? 'school_will_be_contacted' : 'needs_contact'
    else
      'needs_info'
    end
  end

  def who_will_order_devices_label
    case who_will_order_devices
    when 'school'
      'School'
    when 'responsible_body'
      school.responsible_body.humanized_type.capitalize
    end
  end

  def school_contact=(value)
    super(value)
    self.status = infer_status
  end

private

  def set_defaults
    self.status ||= infer_status
  end
end
