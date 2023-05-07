ActiveRecord::Base.transaction do
  30.times do
    Administrator.create(name: Faker::Name.unique.first_name,
                surname: Faker::Name.unique.last_name,
                email: Faker::Internet.unique.email,
                phone_number: Faker::PhoneNumber.unique.cell_phone,
                position: Faker::Construction.role)

    Client.create(name: Faker::Name.unique.first_name,
                surname: Faker::Name.unique.last_name,
                email: Faker::Internet.unique.email,
                phone_number: Faker::PhoneNumber.unique.cell_phone,
                address: Faker::Address.unique.street_name,
                credit_card: Faker::Stripe.valid_card)            

    Fuel.create(type_fuel: [95, 100, 99,92].sample,
              price: rand(30..60))

    Car.create(brand: Faker::Vehicle.unique.manufacture,
            model: Faker::Vehicle.unique.model,
            graduation_year: Faker::Vehicle.year,
            year_license_plate: Faker::Vehicle.license_plate(state_abbreviation: 'FL'),
            tank_volume: rand(10..100),
            engine_power: rand(100..900),
            type_fuel:[95, 100, 99,92].sample,
            client_id: Client.all.sample.id)

    LoyaltyProgram.create(name: Faker::Team.unique.state,
                        bonus_count: rand(100..400),
                        start_date: Faker::Date.in_date_period(year: 2018, month: 2),
                        end_date: Faker::Date.unique.in_date_period(year: 2018, month: 4))

    CurrentDateTransaction.create(client_id:Client.all.sample.id,
                                loyalty_program_id: LoyaltyProgram.all.sample.id,
                                count_bonus: rand(100..400))

    GasStation.create(address: Faker::Address.unique.street_name,
                    count_availability: rand(3000..5000),
                    history_order: rand(100..2000))
    
    UserLoyaltyProgram.create(client_id: Client.all.sample.id,
                            loyalty_program_id: LoyaltyProgram.all.sample.id,
                            count_bonus: rand(300..800))
  end
  Fuel.all.each do |fuel| 
    fuel_volume = rand(5..150)
    Transaction.create(client_id: Client.all.sample.id,
                  car_id:  Car.all.sample.id,
                  gas_station_id:  GasStation.all.sample.id,
                  fuel_id: fuel.id,
                  fuel_volume: fuel_volume ,
                  datatime_refueling: Faker::Date.between(from: '2018-01-23', to: '2023-05-10'),
                  total_cost: fuel.price* fuel_volume,
                  administrator_id: Administrator.all.sample.id)
  end
end 
