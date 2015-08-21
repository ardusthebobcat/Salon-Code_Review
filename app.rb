require('sinatra')
require('sinatra/reloader')
require('./lib/clients')
require('./lib/stylists')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "to_do"})


get("/") do
  erb(:index)
end
