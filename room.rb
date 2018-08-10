class Room

  attr_accessor :songs, :guests, :space

  def initialize(songs = [], guests, space)
    @songs = songs
    @guests = guests
    @space = space
  end

def song_list
  return @songs.map{|s| s.title}
end

def guests_names
  return @guests.map{|g| g.name}
end

def free_space
  return @space - @guests.count
end

def add_song(song)
  @songs << song
end

def add_guest(guest)
  @guests << guest if free_space > 0
  "Room full!" if free_space == 0
end

def remove_guest(guest)
  @guests.delete guest
end

end
