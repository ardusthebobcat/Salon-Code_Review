class Stylists

  attr_reader(:id, :name, :client_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id).to_i()
    @name = attributes.fetch(:name)
    @client_id = []
  end
end
