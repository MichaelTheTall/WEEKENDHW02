require('minitest/autorun')
require('minitest/rg')
require_relative('../CCC')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @splhtb = Song.new("Sgt. Pepper's Lonely Heart Throb Band")
  end

  def test_song_has_title
    assert_equal("Sgt. Pepper's Lonely Heart Throb Band", @splhtb.title)
  end

end
