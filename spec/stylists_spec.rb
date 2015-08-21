require('spec_helper')

describe(Stylists) do
  ## spec-template
  # describe('#') do
  #   it('') do
  #     expect().to eq()
  #   end
  # end
  describe('#id') do
    it('Returns the id of a new stylist') do
      new_stylist = Stylists.new({:id =>nil, :name => "Darren"})
      expect(new_stylist.id()).to eq(0)
    end
  end

  describe('#name') do
    it('returns the name of a new stylist') do
      new_stylist = Stylists.new({:id => nil, :name => "Darren"})
      expect(new_stylist.name()).to eq("Darren")
    end
  end

  describe('#client_id') do
    it('returns the ids of clients assigned to a stylist, currently empty') do
      new_stylist = Stylists.new({:id => nil, :name => "Sue"})
      expect(new_stylist.client_id()).to eq([])
    end

    # it('returns the ids of clients assigned to a stylist') do
    #   new_client = Clients.new({:id =>nil, :name => "Michael", :email => "some_gmail@gmail.com", :phone =>"111-111-1111", :address=>"404 Yellow Brick Rd.", :city => "Wizard_of_Oz", :zip =>00001, :stylist_id =>nil})
    #   new_stylist = Stylists.new({:id => nil, :name => "Sue", :client_id => new_client})
    #   expect(new_stylist.client_id()).to eq([new_client])
    # end
  end
end
