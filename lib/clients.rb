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

######################## REGULAR METHODS ########################
  define_method(:update_client) do
    DB.exec("UPDATE clients SET name='#{@name}', email = '#{@email}', phone = #{@phone}, address='#{@address}', city = '#{@city}', zip = #{@zip}, stylist_id = #{@stylist_id} WHERE id=#{@id};")
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, email, phone, address, city, zip) VALUES ('#{@name}','#{@email}','#{@phone}','#{@address}','#{@city}',#{@zip}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end


  define_method(:set_stylist) do |pass_id|
    @stylist_id = pass_id.to_i
    self.update_client()
  end
end
