class Pokemon
    attr_accessor :name, :type, :id, :db

    def initialize(name:,type:,id:,db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end

    def self.find(id,db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end



end
