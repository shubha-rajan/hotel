module HotelSystem
  class Block
    attr_reader :rooms, :date_range, :discount_rate

    def initialize(rooms:, date_range:, discount_rate:)
      @rooms = rooms
      @date_range = date_range
      @discount_rate = discount_rate
      @rooms.each { |room| block_room(room) }
    end

    def block_room(room)
      room.block = self
      room.rate = discount_rate
    end
  end
end
