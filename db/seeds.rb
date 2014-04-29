# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# init two test locations
l1 = Location.create(name: "Test Location 1", code: 0001)
l2 = Location.create(name: "Test Location 2", code: 0002)
