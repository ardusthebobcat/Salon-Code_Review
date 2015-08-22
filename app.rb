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

####################### ENTIRE CLIENTS ROUTE (long code is long) ######################
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

post("/clients_update/name") do
  temp_id = params.fetch('id').to_i()
  temp_name = params.fetch('name')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_name, :email => temp_client.email, :phone => temp_client.phone, :address => temp_client.address, :city => temp_client.city, :zip => temp_client.zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end

post("/clients_update/email") do
  temp_id = params.fetch('id').to_i()
  temp_email = params.fetch('email')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_email, :phone => temp_client.phone, :address => temp_client.address, :city => temp_client.city, :zip => temp_client.zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end

post("/clients_update/phone") do
  temp_id = params.fetch('id').to_i()
  temp_phone = params.fetch('phone')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_client.email, :phone => temp_phone, :address => temp_client.address, :city => temp_client.city, :zip => temp_client.zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end

post("/clients_update/address") do
  temp_id = params.fetch('id').to_i()
  temp_address = params.fetch('address')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_client.email, :phone => temp_client.phone, :address => temp_address, :city => temp_client.city, :zip => temp_client.zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end
post("/clients_update/city") do
  temp_id = params.fetch('id').to_i()
  temp_city = params.fetch('city')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_client.email, :phone => temp_client.phone, :address => temp_client.address, :city => temp_city, :zip => temp_client.zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end
post("/clients_update/zip") do
  temp_id = params.fetch('id').to_i()
  temp_zip = params.fetch('zip')

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_client.email, :phone => temp_client.phone, :address => temp_client.address, :city => temp_client.city, :zip => temp_zip, :stylist_id => temp_stylist_id})
  replace_client.update_client()
  @all_clients = Clients.all()
  erb(:clients)
end

get('/choose_stylist/:id') do
  @all_stylists = Stylists.all()
  @client_id = params.fetch('id')
  erb(:choose_stylist)
end

get('/choose_stylist/:id/:stylist_id') do
  temp_id = params.fetch("id")
  temp_stylist = params.fetch("stylist_id")

  temp_client = Clients.find(temp_id)

  temp_stylist_id =0

  replace_client = Clients.new({:id => temp_id, :name => temp_client.name, :email => temp_client.email, :phone => temp_client.phone, :address => temp_client.address, :city => temp_client.city, :zip => temp_client.zip, :stylist_id => temp_stylist})
  replace_client.update_client()
  @all_clients = Clients.all()

  redirect(:update_stylist)
end

get('/clients/delete/:id') do
  temp_id = params.fetch("id").to_i()
  find_client = Clients.find(temp_id)
  find_client.delete_from(temp_id)

  @all_clients = Clients.all()
  redirect("/clients")
end

######################### ENTIRE STYLISTS ROUTE #############################
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

post("/stylists_update/name") do
  temp_id = params.fetch('id').to_i
  @name = params.fetch('name')
  temp_stylist = Stylists.new({:id => temp_id, :name => @name})
  temp_stylist.update_stylist()
  @all_stylists = Stylists.all()
  erb(:stylists)
end

get('/stylists/delete/:id') do
  temp_id = params.fetch("id").to_i()
  find_stylist = Stylists.find(temp_id)
  find_stylist.delete()

  @all_stylists = Stylists.all()
  redirect("/stylists")
end
