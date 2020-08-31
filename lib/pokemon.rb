
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  # def self.save(name, type, db)
  #   sql = <<-SQL
  #     INSERT INTO pokemon (name, type) VALUES (?, ?);
  #   SQL
  #
  #   db.execute(sql, [name, type])
  #
  # end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  # def self.find(id, db)
  #   sql = <<-SQL
  #     SELECT * FROM pokemon WHERE id = (?);
  #   SQL
  #   pokemon = db.execute(sql, [id]).flatten
  #
  #   Pokemon.new(name, type, db)
  # end
  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
  end
end
