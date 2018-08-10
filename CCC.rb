class CCC

attr_accessor :rooms, :till

def initialize(rooms = [], till)
  @rooms = rooms
  @till = till
  @fee_cost = 5
end

def fee(guest)
  guest.wallet -= @fee_cost
  @till += @fee_cost
end

def fav_check(room, guest)
  return "TUNE!" if room.song_list.any?{|t| t == guest.fav_song}
end

end
