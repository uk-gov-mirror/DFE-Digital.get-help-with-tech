# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MobileNetwork.upsert_all(
  [
    { brand: '1pMobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: '360Coms Telecom', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: '365 Mobile', host_network: 'O2, Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'AfriMobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Anywhere Care Ownfone (formerly Age UK Ownfone)', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'AlwaysOnline Wireless', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Anywhere Sim', host_network: 'O2, Vodafone, EE, Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Asda Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Auracall Travel Talk', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Axis Telecom', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'BT Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'BT Onephone (BTOP)', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'C4C Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Call & Give', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Calteq', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Champions Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'CUniq', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'CMLink', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'CTExcel', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Ctrl Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Ecotalk', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'EE', host_network: 'EE', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'ETS Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'FreedomPop', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Fonome Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Gamma Telecom', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Gemini Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'giffgaff', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Global', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Globalgig', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'HP Mobile Connect', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'i3 Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'iD Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'JOi Telecom', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Jump', host_network: 'O2, Vodafone, EE, Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Just Utilities', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'KC Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Lebara Mobile', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Lycamobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Meem Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'NordTelekom', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Now PAYG', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'O2', host_network: 'O2', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Pebble Mobile Network', host_network: 'O2, Vodafone, EE, Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Plusnet Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Rok Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'RWG Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Sky Mobile', host_network: 'O2', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'SMARTY', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Superdrug Mobile', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Talk Home Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Talkmobile', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'TalkTalk Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'TalkXtra Mobile', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Telecom Plus', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Telfoni', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Tesco Mobile', host_network: 'O2', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'The Phone Co-op', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Three', host_network: 'Three', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Torica Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Toggle Mobile', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Truphone', host_network: 'O2', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Utilita', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Vectone Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Virgin Mobile', host_network: 'EE', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Vivio', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Vodafone', host_network: 'Vodafone', participating_in_scheme: true, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'VOXI', host_network: 'Vodafone', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'White Mobile', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'XLN Telecom', host_network: 'Three', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
    { brand: 'Zevvle', host_network: 'EE', participating_in_scheme: false, created_at: Time.now.utc, updated_at: Time.now.utc },
  ],
  unique_by: :brand,
)
