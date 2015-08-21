require('pry')
class Clients

  attr_reader(:id, :name, :email, :phone, :address, :city, :zip, :stylist_id)

  #noticed someone line it up this way, figured I'd try it out
  #to see if I liked it. #notsureabouthis
  define_method(:initialize) do |attributes|
    @id         = attributes.fetch(:id)
    @name       = attributes.fetch(:name)
    @email      = attributes.fetch(:email)
    @phone      = attributes.fetch(:phone)
    @address    = attributes.fetch(:address)
    @city       = attributes.fetch(:city)
    @zip        = attributes.fetch(:zip)
    @stylist_id = nil
  end

######################## SINGLETON METHODS ########################
  define_singleton_method(:all) do
    all_clients_query = DB.exec("SELECT * FROM clients;")
    results_array = []
    all_clients_query.each() do |client|
      id         = client.fetch('id').to_i
      name       = client.fetch('name')
      email      = client.fetch('email')
      phone      = client.fetch('phone')
      address    = client.fetch('address')
      city       = client.fetch('city')
      zip        = client.fetch('zip')
      stylist_id = client.fetch('stylist_id').to_i
      results_array.push(Clients.new({:id => id, :name => name, :email => email, :phone => phone, :address => address, :city => city, :zip => zip, :stylist_id => stylist_id}))
    end
    results_array
  end

  define_singleton_method(:find) do |id|
    Clients.all().each() do |client|
      if client.id == id
        return client
      end
    end
  end

######################## REGULAR METHODS ########################
  define_method(:==) do |other_thing|
    self.id().eql?(other_thing.id)
  end

  define_method(:update_client) do
    DB.exec("UPDATE clients SET name='#{@name}', email = '#{@email}', phone = #{@phone}, address='#{@address}', city = '#{@city}', zip = #{@zip}, stylist_id = #{@stylist_id} WHERE id=#{@id};")
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, email, phone, address, city, zip) VALUES ('#{@name}','#{@email}',#{@phone},'#{@address}','#{@city}',#{@zip}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:set_stylist) do |pass_id|
    @stylist_id = pass_id.to_i
    self.update_client()
  end

  #>EVERY TIME< I write a "delete" method, I think of a Deathnote scene. "*scribbling names down* DELETE DELETE DELETE DELETE DELETE . . ." <will try to make the image work on webpage if I have time>
  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{@id}")
  end

  define_method(:delete_from) do |pass_id|
    DB.exec("DELETE FROM clients WHERE id = #{pass_id}")
  end
end
