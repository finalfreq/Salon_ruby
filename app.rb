require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/stylist'
require './lib/client'
require 'pg'
require 'pry'

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

post('/clients') do
  name = params.fetch('name')
  client = Client.new(name: name, id: nil, stylist_id: 0)
  client.save
  @clients = Client.all
  erb(:clients)
end

get('/clients/:id') do
  @client = Clint.find(params.fetch('id').to_i())
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
  erb(:stylist_info)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update(name: name)
  erb(:stylist_info)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
