class Clients

  attr_reader(:id, :name, :email, :phone, :address, :city, :zip, :stylist_id)

  #noticed someone line it up this way, figured I'd try it out
  #to see if I liked it. #notsureabouthis
  define_method(:initialize) do |attributes|
    @id         = attributes.fetch('')
    @name       = attributes.fetch('')
    @email      = attributes.fetch('')
    @phone      = attributes.fetch('')
    @address    = attributes.fetch('')
    @city       = attributes.fetch('')
    @zip        = attributes.fetch('')
    @stylist_id = attributes.fetch('')
  end
end
