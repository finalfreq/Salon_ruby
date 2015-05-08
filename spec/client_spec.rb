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

  describe('.find') do
      it('finds a client in the database by id') do
        client = Client.new(name: "john smith", id: 1, stylist_id: 1)
        client1 = Client.new(name: "john smith", id: 1, stylist_id: 1)
        client.save
        client1.save
        expect(Client.find(client.id)).to(eq(client))
      end
    end

    describe('#update') do
      it('allows the client name to be changed or updated') do
        client = Client.new(name: "john smith", id: 1, stylist_id: 1)
        client.save
        client.update(name: "fred smith")
        expect(client.name).to(eq("fred smith"))
      end

      it("allows the client stylist's id to be updated") do
        client = Client.new(name: "john smith", id: 1, stylist_id: 1)
        client.save
        client.update(stylist_id: 2)
        expect(client.stylist_id).to(eq(2))
      end
    end






end
