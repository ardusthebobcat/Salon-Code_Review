require('rspec')
require('stylists')

describe(Stylists) do
  ## spec-template
  # describe('#') do
  #   it('') do
  #     expect().to eq()
  #   end
  # end

  describe('#name') do
    it('returns the name of a new stylist') do
      new_stylist = Stylists.new({:id => nil, :name => "Darren"})
      expect(new_stylist.name()).to eq("Darren")
    end
  end
end
