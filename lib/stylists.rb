class Stylists

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id         = attributes.fetch(:id).to_i()
    @name       = attributes.fetch(:name)
  end
  ######################## SINGLETON METHODS ########################
  define_singleton_method(:all) do
    all_stylists_query = DB.exec("SELECT * FROM stylists;")
    results_array = []
    all_stylists_query.each() do |stylist|
      id   = stylist.fetch('id')
      name = stylist.fetch('name')

      results_array.push(Stylists.new({:id => id, :name => name}))
    end
    results_array
  end

  ######################## REGULAR METHODS ########################
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |other_thing|
    self.id().eql?(other_thing.id)
  end

  define_method(:update_stylist) do
    DB.exec("UPDATE stylists SET name='#{@name}' WHERE id = #{@id};")
    #If stylist had multiple properties
    #  DB.exec("UPDATE stylist SET property = #{@variable}, property = #{@variable} . . . WHERE id=#{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{@id}")
  end

end
