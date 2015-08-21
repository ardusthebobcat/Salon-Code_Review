class Stylists

  attr_reader(:id, :name, :client_id)

  define_method(:initialize) do |attributes|
    @id         = attributes.fetch(:id).to_i()
    @name       = attributes.fetch(:name)
    @client_id  = []
  end
  ######################## SINGLETON METHODS ########################
  define_method(:all) do
    all_stylists_query = DB.exec("SELECT * FROM stylists;")
    results_array = []
    all_stylists_query.each() do |stylist|
      id  = stylist.fetch('id')
      name = stylist.fetch('name')
      client_id = stylist.fetch('client_id')
      results_array.push(Stylists.new({:id => id, :name => name, :client_id => client_id}))
    end
    results_array
  end


  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name, client_id) VALUES ('#{@name},#{@client_id}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
end
