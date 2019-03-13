require_relative "err/errors"

module HotelSystem
  class Block
    attr_reader :rooms, :date_range, :discount_rate, :reservations, :group_name

    def initialize(rooms:, date_range:, discount_rate:, group_name:)
      if rooms.length > 5 || rooms.length < 1
        raise BlockError, "A block must contain 1 to 5 rooms"
      end
      @rooms = rooms
      @date_range = date_range
      @discount_rate = discount_rate
      @rooms.each { |room| block_room(room) }
      @group_name = group_name
      @reservations = {}
    end

    def add_reservation(reservation)
      reservations[reservation.name] = reservation
    end

    def overlap?(new_date_range)
      return date_range.overlap?(new_date_range)
    end

    def block_room(room)
      room.add_block(self)
      room.rate = discount_rate
    end

    def has_room?(room)
      return rooms.include?(room)
    end

    def all_reservations
      return reservations.values
    end
  end
end
