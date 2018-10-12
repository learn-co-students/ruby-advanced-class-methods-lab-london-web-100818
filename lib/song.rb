require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  @@songnames=[]
@@songnamesarray=[]
def self.create
self.new.save
self.all[0]

end

def self.new_by_name(name)
  song=self.new
  song.name= name
  song
end
def self.create_by_name(name)
song=self.new
song.name=name
song.save

song
end

def self.find_by_name(songname)

@@all.find {|n| n.name == songname}

end

def self.find_or_create_by_name(songname)


 if self.find_by_name(songname)== nil

   self.create_by_name(songname)
 else
   self.find_by_name(songname)
end
end

def self.alphabetical
@@all.each do |x|
  @@songnames << x.name
end
a=@@songnames.sort
a.each do |x|
  @@songnamesarray << self.find_by_name(x)
  end
  @@songnamesarray
end

def self.new_from_filename(songname)
  song=self.new
  songarray=songname.split(' - ')
  song.name=songarray[1].split('.')[0]
  song.artist_name=songarray[0]
  song
end

def self.create_from_filename(songname)
  song=self.new
  songarray=songname.split(' - ')
  song.name=songarray[1].split('.')[0]
  song.artist_name=songarray[0]
  song.save

end












def self.destroy_all
  @@all=[]
end




  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
