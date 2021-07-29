class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end
    def files
        Dir.glob("*.{mp3}")
        Dir.children(@path)
    end
    def import
        arrFileSong = files
        arrFileSong.each do |file|
            Song.new_by_filename(file)
        end
    end
end