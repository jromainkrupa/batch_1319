require 'csv'
require_relative 'room'

class RoomRepository
  attr_reader :rooms
  def initialize(csv_file)
    @rooms = []
    @csv_file = csv_file
    load_csv
  end

  def find(id)
    @rooms.find {|room| room.id == id}
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      capacity = row[:capacity].to_i
      @rooms << Room.new(name: row[:name], id: id, capacity: capacity)
    end
  end
end