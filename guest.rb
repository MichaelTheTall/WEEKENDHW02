class Guest

  attr_accessor :name, :wallet, :fav_song

  def initialize(name, wallet = 0, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def my_fave(song)
    return "TUNE!" if fav_song == song
  end

end
