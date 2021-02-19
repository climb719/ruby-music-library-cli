class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist if artist
        self.genre = genre if genre
    end
    
    def artist=(artist) 
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)  
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

    def self.create(created_song)
        created_song = Song.new(created_song)
        created_song.save
        created_song
    end

    def self.find_by_name(name)
        @@all.detect { |song| song.name == name }
    end

    def self.find_or_create_by_name(name)
        song_name = self.find_by_name(name)
            if song_name
                song_name
        else song_name = self.create(name)
            song_name
        end
    end

    def self.new_from_filename(filename)
        new_song = filename.split(" - ")
        song = self.new(new_song[1])
        song.artist = Artist.find_or_create_by_name(new_song[0])
        song.genre = Genre.find_or_create_by_name(new_song[2].gsub(".mp3", ""))
        song
    end

    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
    end
             
end
