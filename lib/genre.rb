class Genre
    extend Concerns::Findable

    attr_accessor :name
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
    end

    def songs
        @songs
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

    def artists
        self.songs.collect { |song| song.artist }.uniq
    end

end