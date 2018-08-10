require('minitest/autorun')
require('minitest/rg')
require_relative('../CCC')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestGuest < Minitest::Test

  def setup
    @james = Guest.new("James", 60, "Yellow Submarine")
    @mike = Guest.new("Mike", 80, "Maybe")
    @rebecca = Guest.new("Rebecca", 100, "Iron Man")
  end

  def test_guest_has_name
    assert_equal("Mike", @mike.name)
  end

  def test_guest_has_dosh
    assert_equal(100, @rebecca.wallet)
  end

  def test_guest_has_fav_song
    assert_equal("Yellow Submarine", @james.fav_song)
  end

  def test_my_fave
    assert_equal("TUNE!", @rebecca.my_fave("Iron Man"))
  end
end
