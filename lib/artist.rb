class Artist

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end
    def name=(name)
        @name = name
    end
    def save
        @@all << self
    end
    def self.all
        @@all
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def add_song(song_one)
        song_one.artist = self
        @songs << song_one
    end
    def self.find_or_create_by_name(name)
        objArtist = @@all.find{|artist| artist.name == name}
        if !objArtist.nil?
            return objArtist
        else
            objArtist = self.new(name)
        end
        objArtist
    end
    def print_songs
        songs.each do |song|
            puts "#{song.name}"
        end
    end
end