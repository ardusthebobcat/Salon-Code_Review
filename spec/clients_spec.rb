require('spec_helper')

describe(Clients) do
  ## spec-template
  # describe('#') do
  #   it('') do
  # new_client = Clients.new({:id =>nil, :name => "", :email => "@gmail.com", :phone =>"111-111-1111", :address=>"", :city => "", :zip =>00002, :stylist_id =>nil})
  #     expect().to eq()
  #   end
  # end
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
end
