class Client

  attr_reader(:name, :id, :stylist_id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @stylist_id = attributes[:stylist_id]
  end

  def save()
      result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id ;")
      @id = result.first['id'].to_i
    end


    def self.all()
      client_list = []
      returned_clients = DB.exec("SELECT * FROM clients")
      returned_clients.each() do |client|
        name = client['name']
        id = client['id'].to_i
        stylist_id = client['stylist_id'].to_i
        client_list.push(Client.new(name: name, id: id, stylist_id: stylist_id))
      end
      client_list
    end

    def ==(another_client)
      self.name == another_client.name && self.id == another_client.id
    end

    def self.find(id)
        client = DB.exec("SELECT * FROM clients WHERE id = #{id} ;")
        name = client.first['name']
        stylist_id = client.first['stylist_id']
        Client.new(name: name, id: id, stylist_id: stylist_id)
    end

    def update(attributes)
      @name = attributes.fetch(:name, @name)
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id} ;")

      @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
      DB.exec("UPDATE clients SET stylist_id = #{@stylist_id} WHERE id = #{self.id} ;")
    end









end
