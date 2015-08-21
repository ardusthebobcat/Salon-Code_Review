require('spec_helper')

describe(Clients) do
  ## spec-template
  # describe('#') do
  #   it('') do
  #     expect().to eq()
  #   end
  # end
  describe('#id') do
    it('returns id of a new client') do
      new_client = Clients.new({:id =>nil, :name => "Michael", :email => "some_gmail@gmail.com", :phone =>"111-111-1111", :address=>"404 Yellow Brick Rd.", :city => "Wizard_of_Oz", :zip =>00001, :stylist_id =>nil})
      expect(new_client.id()).to eq(nil)
    end
  end
end
