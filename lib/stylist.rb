class Stylist

  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]

  end

  def save()
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first['id'].to_i
  end

  def self.all()
    stylists = []
    returned_stylists = DB.exec("SELECT * FROM stylists")
    returned_stylists.each() do |stylist|
      name = stylist['name']
      id = stylist['id'].to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end

  def ==(another_stylist)
    self.name == another_stylist.name && self.id == another_stylist.id
  end

  def self.find(id)
    stylist = DB.exec("SELECT * FROM stylists WHERE id = #{id} ;")
    name = stylist.first['name']
    Stylist.new(name: name, id: id)
  end

  def update(attributes)
    @name = attributes.fetch(:name, @name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def clients()
    all_clients = []
    found_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id};")
    found_clients.each() do |client|
      name = client['name']
      id = client['id'].to_i()
      stylist_id = @id
      all_clients.push(Stylist.new(name: name, id: id, stylist_id: @id))
    end
    all_clients
  end

  def delete()
    DB.exec("DELETE FROM stylists WHERE id = #{self.id};")
  end
end
