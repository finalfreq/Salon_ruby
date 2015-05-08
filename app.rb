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
  @stylists = Stylist.all
  erb(:clients)
end

post('/clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id')
  client = Client.new(name: name, id: nil, stylist_id: stylist_id)
  client.save
  @clients = Client.all
  @stylists = Stylist.all
  erb(:clients)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @stylists = Stylist.all
  @stylist = Stylist.find(@client.stylist_id)
  erb(:client_info)
end

post('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @stylists = Stylist.all
  @stylist = Stylist.find(params.fetch('stylist_id'))
  @client.update(stylist_id: @stylist.id)
  erb(:client_info)
end

patch("/clients/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i())
  @client.update(name: name)
  @stylists = Stylist.all
  @stylist = Stylist.find(@client.stylist_id)
  erb(:client_info)
end

delete("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @stylists = Stylist.all()
  @clients = Stylist.all()
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
  @clients = Client.all
  erb(:stylist_info)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  client_ids = params.fetch('client_ids')
  @stylist.update(name: name)
  @clients = Client.all
  erb(:stylist_info)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all
  erb(:stylists)
end
