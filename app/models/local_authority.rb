class LocalAuthority < ResponsibleBody
  enum organisation_type: {
    borough: 'BGH',
    city: 'CIT',
    city_corporation: 'CC',
    combined_authority: 'COMB',
    council_area: 'CA',
    county: 'CTY',
    district: 'DIS',
    london_borough: 'LBO',
    metropolitan_district: 'MD',
    non_metropolitan_district: 'NMD',
    strategic_regional_authority: 'SRA',
    unitary_authority: 'UA',
  }

  validates :organisation_type, presence: true

  has_one :la_funded_place, foreign_key: 'responsible_body_id'

  def create_la_funded_places!(urn:, device_allocation: 0, router_allocation: 0, extra_args: {})
    return if la_funded_place.present?

    attrs = {
      responsible_body: self,
      urn: urn,
      name: 'LA Funded Places',
      establishment_type: 'la_funded_place',
      address_1: address_1,
      address_2: address_2,
      address_3: address_3,
      town: town,
      county: county,
      postcode: postcode,
    }.reverse_merge(extra_args)

    funded_places = LaFundedPlace.create!(attrs)
    funded_places.create_preorder_information!(who_will_order_devices: 'responsible_body', will_need_chromebooks: 'no')
    funded_places.device_allocations.std_device.create!(allocation: device_allocation)
    funded_places.device_allocations.coms_device.create!(allocation: router_allocation)
    funded_places
  end
end
