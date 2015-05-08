require 'spec_helper'

describe(Client) do
  describe('#name') do
    it('provides the name of the client') do
      client = Client.new(name: "john smith", id: nil, stylist_id: nil)
      expect(client.name).to(eq("john smith"))
    end
  end

  describe('#stylist_id') do
    it('provides the id of the clients stylist') do
      client = Client.new(name: "john smith", id: nil, stylist_id: 1)
      expect(client.stylist_id).to(eq(1))
    end
  end

  describe('.all') do
    it('has no clients at first') do
      expect(Client.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves client to database') do
      client = Client.new(name: "john smith", id: 1, stylist_id: 1)
      client.save
      expect(Client.all).to(eq([client]))
    end
  end







end
