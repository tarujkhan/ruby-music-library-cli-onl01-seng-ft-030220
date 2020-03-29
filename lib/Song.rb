require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre

@@all = []
def initialize(name, artist= nil, genre= nil)
@name = name
self.artist = artist if artist
self.genre = genre if genre

end 

def self.all
  @@all 
end 

def self.destroy_all
  @@all.clear
end 

def save
  @@all << self 
  self
end 

def self.create(name)
  created_song = self.new(name)
  created_song.save
  end 
  
def artist=(artist)
  @artist = artist
  artist.add_song(self)
end 

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
  
end 
def self.find_by_name(name)
  #binding.pry
    @@all.detect {|a| a.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
 
      self.find_by_name(name) || self.create(name)
end 
end 




