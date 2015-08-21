require('sinatra')
require('sinatra/reloader')
require('./lib/clients')
require('./lib/stylists')
also_reload('lib/**/*.rb')
require("pg")
require('pry')

DB = PG.connect({:dbname => "hair_salon"})


get("/") do
  erb(:index)
end

get('/clients') do
  @all_clients = Clients.all()
  erb(:clients)
end

post('/clients/new') do
  name      = params.fetch("name", @name)
  email     = params.fetch("email", 'no+email')
  phone     = params.fetch("phone", "no+phone")
  address   = params.fetch("address", "no+address")
  city      = params.fetch("city", "no+city")
  zip       = params.fetch("zip", 99999)
  new_client= Clients.new({:id => nil, :name => name, :email => email, :phone => phone, :address => address, :city => city, :zip => zip, :stylist_id => nil})
  new_client.save()
  @all_clients = Clients.all()
  erb(:clients)
end

get('/clients/:id') do
  @one_client = Clients.find(params.fetch("id").to_i())
  @one_client_name = @one_client.name()
  erb(:clients_update)
end

get('/clients/delete/:id') do
  temp_id = params.fetch("id").to_i()
  find_client = Clients.find(temp_id)
  find_client.delete_from(temp_id)

  @all_clients = Clients.all()
  redirect("/clients")
end

get('/stylists') do
  @all_stylists = Stylists.all()
  erb(:stylists)
end

post('/stylists/new') do
  name      = params.fetch("name", @name)
  new_stylist= Stylists.new({:id => nil, :name => name})
  new_stylist.save()
  @all_stylists = Stylists.all()
  erb(:stylists)
end
#
get('/stylists/:id') do
  @one_stylist = Stylists.find(params.fetch("id").to_i())
  @one_stylist_name = @one_stylist.name()
  erb(:stylists_update)
end

get('/stylists/delete/:id') do
  temp_id = params.fetch("id").to_i()
  find_stylist = Stylists.find(temp_id)
  find_stylist.delete()

  @all_stylists = Stylists.all()
  redirect("/stylists")
end
