require 'spec_helper'

describe(Stylist) do

  describe('#name') do
    it('provides the name of the stylist') do
      stylist = Stylist.new(name: "dolly parton", id: nil)
      expect(stylist.name).to(eq("dolly parton"))
    end
  end

  describe('#id') do
    it('provides the id of the stylists') do
      stylist = Stylist.new(name: "dolly parton", id: 1)
      expect(stylist.id).to(eq(1))
    end
  end

  describe('.all') do
    it('has no stylists at first') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves stylist to database') do
      stylist = Stylist.new(name: "dolly parton", id: 1)
      stylist.save
      expect(Stylist.all).to(eq([stylist]))
    end
  end

  describe('.find') do
    it('finds a stylist in the database by id') do
      stylist = Stylist.new(name: "dolly parton", id: 1)
      stylist1 = Stylist.new(name: "dolly parton", id: 1)
      stylist.save
      stylist1.save
      expect(Stylist.find(stylist.id)).to(eq(stylist))
    end
  end

  describe('#update') do
    it('allows the stylist name to be changed or updated') do
      stylist = Stylist.new(name: "dolly parton", id: 1)
      stylist.save
      stylist.update(name: "bon jovie")
      expect(stylist.name).to(eq("bon jovie"))
    end
  end

  describe('#delete') do
    it('deletes the stylist from the database') do
      stylist = Stylist.new(name: "dolly parton", id: 1 )
      stylist1 = Stylist.new(name: "bon jovie", id: 1)
      stylist.save
      stylist1.save
      stylist.delete
      expect(Stylist.all).to(eq([stylist1]))
    end
  end

  describe('#clients') do
    it('returns all clients of the stylist') do
      stylist = Stylist.new(name: "dolly parton", id: 1 )
      stylist.save
      client = Client.new(name: "john smith", id: 1, stylist_id: 1)
      client1 = Client.new(name: "fred smith", id: 1, stylist_id: 1)
      client.save
      client1.save
      client.update(stylist_id: stylist.id)
      client1.update(stylist_id: stylist.id)
      expect(stylist.clients).to(eq([client, client1]))
    end
  end
end
