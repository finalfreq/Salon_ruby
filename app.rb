require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pg'

DB = PG.connect(dbname: 'hair_salon')

get('/') do
  @clients = Client.all
  @stylists = Stylist.all
  erb(:index)
end

get('/clients') do
  @clients = Client.all
  erb(:clients)
end

get('/stylists') do
  @stylists = Stylist.all
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new(name: name, id: nil)
  stylist.save()
  @stylists = Stylist.all
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
end
