class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    song.name = name
    self.all << song
    return song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    return song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    return song
  end
  
  def self.find_by_name(song_name)
      self.all.each do |i|
        if i.name == song_name
          return i
        end
      end  
    return nil
  end
  
  def self.find_or_create_by_name(song_name)
    if !self.find_by_name(song_name)
     self.create_by_name(song_name)
    end
     self.find_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by! {|i| i.name}
  end
  
  def self.new_from_filename(file_name)
    song_data = file_name.split(/(.+?)\s-\s(.+?)\..*/)
    song = self.new
    song.name = song_data[2]
    song.artist_name = song_data[1]
    self.all << song
    return song
  end
  
   def self.create_from_filename(file_name)
    song_data = file_name.split(/(.+?)\s-\s(.+?)\..*/)
    song = self.new
    song.name = song_data[2]
    song.artist_name = song_data[1]
    self.all << song
    return song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  
  def save
    self.class.all << self
  end
 
end