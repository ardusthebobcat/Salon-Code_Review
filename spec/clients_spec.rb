require('spec_helper')

describe(Clients) do
  ## spec-template
  # describe('#') do
  #   it('') do
  # new_client = Clients.new({:id =>nil, :name => "", :email => "@gmail.com", :phone =>"111-111-1111", :address=>"", :city => "", :zip =>00002, :stylist_id =>nil})
  #     expect().to eq()
  #   end
  # end

####################ATTRIBUTE READER SPECS #########################
  describe('#id') do
    it('returns id of a new client') do
      new_client = Clients.new({:id =>nil, :name => "Michael", :email => "some_gmail@gmail.com", :phone =>"111-111-1111", :address=>"404 Yellow Brick Rd.", :city => "Wizard_of_Oz", :zip =>00001, :stylist_id =>nil})
      expect(new_client.id()).to eq(nil)
    end
  end

  describe('#name') do
    it('returns name of a new client') do
      new_client = Clients.new({:id =>nil, :name => "Legolas", :email => "legolas_email@gmail.com", :phone =>"111-111-1111", :address=>"Near the forest", :city => "Rivendell", :zip =>00002, :stylist_id =>nil})
      expect(new_client.name()).to eq("Legolas")
    end
  end

  describe('#email') do
    it('returns Elrond"s email') do
  new_client = Clients.new({:id =>nil, :name => "Elrond", :email => "I_live_long_time@gmail.com", :phone =>"111-111-1111", :address=>"My Palace", :city => "Rivendell", :zip =>00003, :stylist_id =>nil})
      expect(new_client.email).to eq("I_live_long_time@gmail.com")
    end
  end

#################### Singleton Method Testing #########################
  describe('.all') do
    it('should return the new client from the database') do
      #You need really sharp scissors to cut Elven hair, apparently
      new_client = Clients.new({:id => nil, :name => "Nimrodel", :email => "tree-house-maid@gmail.com", :phone => 55555555, :address => "In a tree (whats an address?)", :city => "Lothlorien", :zip =>00004, :stylist_id => nil})
      new_client.save()
      expect(Clients.all()).to eq([new_client])
    end
  end

#################### Method Testing #########################
  describe('#delete') do
    it("should create, add, then delete a client entry") do
      new_client = Clients.new({:id => nil, :name => "Eol", :email => "sword_maker_master", :phone => 55555555, :address => "Ye Olde Swordmaker", :city => "Its a secret", :zip =>00005, :stylist_id => nil})
      new_client.save()

      new_client.delete()
      expect(Clients.all()).to eq([])
    end
  end
end
