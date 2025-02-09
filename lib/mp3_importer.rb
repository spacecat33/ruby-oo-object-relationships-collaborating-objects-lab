class MP3Importer
    
    attr_accessor :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      Dir[@path+"/*.mp3"].map { |file| file.split("/").last }    
      #OR @files ||= Dir.glob("#{path}/*.mp3").collect { |f| f.gsub("#{path}/", "") }
    end
  
    def import
      files.each { |file| Song.new_by_filename(file) }
    end

end