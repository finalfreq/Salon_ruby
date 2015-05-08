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
end

get('/stylists') do
  @stylists = Stylist.all
end

post('/Stylist') do

end
