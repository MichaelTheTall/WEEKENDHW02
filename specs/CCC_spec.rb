require('minitest/autorun')
require('minitest/rg')
require_relative('../CCC')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestCCC < Minitest::Test

  def setup
    @hey_jude = Song.new("Hey Jude")
    @hello = Song.new("Hello")
    @splhtb = Song.new("Sgt. Pepper's Lonely Heart Throb Band")
    @yellow_sub = Song.new("Yellow Submarine")
    @war_pigs = Song.new("War Pigs")
    @iron_man = Song.new("Iron Man")
    @snowblind = Song.new("Snowblind")
    @no = Song.new("No")
    @yes = Song.new("Yes")
    @maybe = Song.new("Maybe")

    @sl1 = [@hey_jude, @hello, @splhtb, @yellow_sub]
    @sl2 = [@war_pigs, @iron_man, @snowblind]
    @sl3 = [@no, @yes, @maybe]

    @andy = Guest.new("Andy", 20, "Hey Jude")
    @bob = Guest.new("Bob", 40, "Hello")
    @cathy = Guest.new("Cathy", 30, "Hey Jude")
    @denise = Guest.new("Denis", 70, "Yes")
    @sarah = Guest.new("Sarah", 50, "Hey Jude")
    @helen = Guest.new("Helen", 30, "Warpigs")
    @greg = Guest.new("Greg", 10, "No")

    @james = Guest.new("James", 60, "Yellow Submarine")
    @mike = Guest.new("Mike", 80, "Maybe")
    @rebecca = Guest.new("Rebecca", 100, "Iron Man")

    @gl1 = [@andy, @bob]
    @gl2 = [@cathy, @denise, @sarah, @helen]
    @gl3 = [@greg]

    @r1 = Room.new(@sl1, @gl1, 4)
    @r2 = Room.new(@sl2, @gl2, 10)
    @r3 = Room.new(@sl3, @gl3, 6)

    @rooms = [@r1, @r2, @r3]
    @ccc = CCC.new(@rooms, 1000)
  end

  def test_CCC_has_rooms
    assert_equal(3, @ccc.rooms.count)
  end

  def test_CCC_has_cash
    assert_equal(1000, @ccc.till)
  end

  def test_fee
    @ccc.fee(@mike)
    assert_equal(75, @mike.wallet)
  end

  def test_fav_check
    assert_equal("TUNE!", @ccc.fav_check(@r2, @rebecca))
  end

  def test_add_guest_fav
    @r2.add_guest(@rebecca)
    @ccc.fee(@rebecca)
    assert_equal(1005, @ccc.till)
    assert_equal(5, @r2.guests.count)
    assert_equal(["Cathy", "Denis", "Sarah", "Helen", "Rebecca"], @r2.guests_names)
    assert_equal("TUNE!", @ccc.fav_check(@r2, @rebecca))
  end

  def test_add_guest_no_fav
    @r1.add_guest(@mike)
    @ccc.fee(@mike)
    assert_equal(1005, @ccc.till)
    assert_equal(3, @r1.guests.count)
    assert_equal(["Andy", "Bob", "Mike"], @r1.guests_names)
    assert_nil @ccc.fav_check(@r1, @mike)
  end

  def test_remove_guest
    @r3.remove_guest(@greg)
    assert_equal(0, @r3.guests.count)
    assert_equal([], @r3.guests_names)
  end

  def test_add_song
    @r3.add_song(@hey_jude)
    assert_equal(4, @r3.songs.count)
    assert_equal(["No", "Yes", "Maybe", "Hey Jude"], @r3.song_list)
  end

end
