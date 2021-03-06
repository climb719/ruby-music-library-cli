class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
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

    
    def self.create(created_artist)
        created_artist = Artist.new(created_artist)
        created_artist.save
        created_artist
    end

    def songs
        @songs 
    end

    def add_song(song)
       song.artist = self unless song.artist
         @songs << song unless @songs.include?(song)  
    end


end