# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ApiRequest.create(method: ApiRequestConstants::GET, host: 'http://localhost:5000/', uri: '/api_requests', headerlist: ['Content-Type: application/json', 'Autorization: Basic asdf='])
ApiRequest.create(method: ApiRequestConstants::GET, host: 'http://localhost:5000/', uri: "/api_requests/{id}", headerlist: ['Content-Type: application/json', 'Autorization: Basic asdf='])
