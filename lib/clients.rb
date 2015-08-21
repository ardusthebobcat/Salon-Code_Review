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
    @stylist_id = attributes.fetch(:stylist_id)
  end

  
end
