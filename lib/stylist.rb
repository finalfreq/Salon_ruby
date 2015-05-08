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
  en
