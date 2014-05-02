# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
GameAct.create(name: 'Rock', short_name: 'R')
GameAct.create(name: 'Paper', short_name: 'P')
GameAct.create(name: 'Scissors', short_name: 'S')
GameAct.create(name: 'Lizard', short_name: 'L')
GameAct.create(name: 'Spock', short_name: 'Sp')