require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    self.all << self.new
    self.all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.all << self.new_by_name(name)
    self.all.last
  end

  def self.find_by_name(name)
    self.all.select{|song| song.name == name}.first
  end

  def self.find_or_create_by_name(name)
    if(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort {|x,y| x.name <=> y.name}
  end

  def self.new_from_filename(file)
    name, song = file.split(" - ")
    song, bin = song.split(".")
    new_song = self.new_by_name(song)
    new_song.artist_name = name
    new_song
  end

  def self.create_from_filename(file)
    self.all << self.new_from_filename(file)
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
