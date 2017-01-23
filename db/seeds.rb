# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spb = RailwayStation.create(name: 'Санкт-Петербург')
msk = RailwayStation.create(name: 'Москва')
vrn = RailwayStation.create(name: 'Воронеж')
rst = RailwayStation.create(name: 'Ростов')
krd = RailwayStation.create(name: 'Краснодар')
adl = RailwayStation.create(name: 'Адлер')

spb_adl = Route.create(name: 'Санкт-Петербург - Москва')
msk_krd = Route.create(name: 'Москва - Краснодар')
msk_adl = Route.create(name: 'Москва - Адлер')

Train.create(number: 'SA101', current_station: spb, route: spb_adl)
Train.create(number: 'MA001', current_station: msk, route: msk_adl)
Train.create(number: 'MA002', current_station: msk, route: msk_adl)
Train.create(number: 'MK305', current_station: krd, route: msk_krd)