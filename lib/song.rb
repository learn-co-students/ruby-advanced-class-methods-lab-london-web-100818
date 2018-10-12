require 'pry'

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(name_of_song)
    Song.all.find {|song| song.name == name_of_song}
  end

  def self.find_or_create_by_name(name_of_song)
    if Song.find_by_name(name_of_song)
      Song.find_by_name(name_of_song)
    else
     Song.create_by_name(name_of_song)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|a| a.name}
  end

  def self.new_from_filename(song_from_file)
    song_name = song_from_file.split(' - ')
    song = Song.new
    song.name = song_name[1].chomp('.mp3')
    song.artist_name = song_name[0]
    song.save
    song
  end

  def self.create_from_filename(song_from_file)
    song_array = song_from_file.split(' - ')
    song = Song.new
    song.name = song_array[1].chomp('.mp3')
    song.artist_name = song_array[0]
    song.save
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end
