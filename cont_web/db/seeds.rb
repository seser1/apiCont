# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Contest's calams
#string :cont_id
#string :name
#string :text
#time :start_date
#string :cont_type
#integer :term
#text :users
#text :input_template
#text :data
#text :view
#text :inputs


#seed for testing
Contest.create(cont_id: 'cont_000', name: 'testContest', text: 'Test contest 01', cont_type: 'Cont000', term: 3000, users: '["user1","user2"]', inputs: '{"user1":{"change": 1}, "user2":{"change": 2}}')
