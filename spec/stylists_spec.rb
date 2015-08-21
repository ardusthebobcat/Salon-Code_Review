require('spec_helper')

describe(Stylists) do
  ## spec-template
  # describe('#') do
  #   it('') do
  #     expect().to eq()
  #   end
  # end

####################ATTRIBUTE READER SPECS #########################
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
#################### Singleton Method Testing #########################
  describe('.all') do
    it('should return the new stylist from the database') do
      #You need really sharp scissors to cut Elven hair, apparently
      new_stylist = Stylists.new({:id => nil, :name => "Edward Scissorhands"})
      new_stylist.save()
      expect(Stylists.all()).to eq([new_stylist])
    end
  end

#################### Method Testing #########################
  describe('#stylist_client_matchup') do
    it("should return the stylist ID after a stylist/client have been matched up") do
      #Maybe Excalibur is sharp enough to cut Elven Hair?
      new_stylist = Stylists.new({:id => nil, :name => "King Arthur"})
      new_stylist.save()

      new_client = Clients.new({:id => nil, :name => "Arwen", :email => "none", :phone => 55555555, :address => "Some forest", :city => "Near Minas Tirith", :zip =>00004, :stylist_id => nil})
      new_client.save()

      new_client.set_stylist(new_stylist.id())

      expect(new_client.stylist_id()).to eq(new_stylist.id())

    end
  end
end
