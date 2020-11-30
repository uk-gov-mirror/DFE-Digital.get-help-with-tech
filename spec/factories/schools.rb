FactoryBot.define do
  factory :school, class: 'CompulsorySchool' do
    factory :fe_school, class: 'FurtherEducationSchool' do
      ukprn { Faker::Number.number(digits: 8) }
      urn { nil }
    end

    association :responsible_body, factory: %i[local_authority trust].sample
    urn { Faker::Number.unique.number(digits: 6) }
    name { Faker::Educator.secondary_school }
    computacenter_reference { Faker::Number.number(digits: 8) }
    phase { School.phases.values.sample }
    establishment_type { School.establishment_types.values.sample }

    transient do
      delivery_addresses_count { 1 }
    end

    after(:create) do |school, evaluator|
      create_list(:delivery_address, evaluator.delivery_addresses_count, school: school)
    end

    trait :with_preorder_information do
      preorder_information
    end

    trait :with_headteacher_contact do
      after :create do |school|
        school.contacts << create(:school_contact, :headteacher)
      end
    end

    trait :primary do
      phase { :primary }
    end

    trait :secondary do
      phase { :secondary }
    end

    trait :academy do
      establishment_type { :academy }
      association :responsible_body, factory: :trust
    end

    trait :la_maintained do
      establishment_type { :local_authority }
      association :responsible_body, factory: :local_authority
    end

    trait :with_std_device_allocation do
      association :std_device_allocation, factory: %i[school_device_allocation with_std_allocation]
    end

    trait :with_coms_device_allocation do
      association :coms_device_allocation, factory: %i[school_device_allocation with_coms_allocation]
    end

    trait :can_order_for_specific_circumstances do
      order_state { 'can_order_for_specific_circumstances' }
    end

    trait :in_lockdown do
      order_state { 'can_order' }
    end
  end
end
