class Genre

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name 
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    
    def self.create(created_genre)
        created_genre = Genre.new(created_genre)
        created_genre.save
        created_genre
    end

end