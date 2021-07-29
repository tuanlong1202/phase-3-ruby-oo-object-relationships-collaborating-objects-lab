class Song
    attr_accessor :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @artist = nil
        @@all << self
    end
    def artist=(objArtist)
        @artist = objArtist
    end
    def self.all
        @@all
    end
    def self.new_by_filename(filename)
        arrTmp = filename.split(" - ")
        song = self.new(arrTmp[1])
        artist = Artist.new(arrTmp[0])
        song.artist = artist
        song
    end
    def artist_name=(name)
        artTmp = Artist.all.find{|artist| artist.name == name}
        if artTmp == nil
            artTmp = Artist.new(name)
        end
        self.artist = artTmp
    end
end