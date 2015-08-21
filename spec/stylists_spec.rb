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
  ####The reason I didnt include a save and .== spec is because they get tested heavily, and works in earlier specs####
  describe('#delete') do
    it("should create, add, then delete a stylist entry") do
      new_stylist = Stylists.new({:id => nil, :name => "King Arthur"})
      new_stylist.save()

      new_stylist.delete()
      expect(Stylists.all()).to eq([])
    end
  end
end
