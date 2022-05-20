class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.new_by_filename(file)
        file_arr = file.split(" - ")
        artist = file_arr[0]
        song = file_arr[1]
        song = self.new(song)
        song.artist = artist
        song.artist_name = artist
        song
    end
  
    def artist_name=(name)
      artist = Artist.find_or_create_by_name(name)
      self.artist = artist
      artist.add_song(self)
    end

end