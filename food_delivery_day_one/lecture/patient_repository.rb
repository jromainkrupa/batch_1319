require 'csv'
require_relative 'patient'

class PatientRepository
  attr_reader :patients
  def initialize(csv_file, room_repository)
    @patients = []
    @csv_file = csv_file
    @room_repository = room_repository
    @next_id = ?
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient

    @next_id += 1
    
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      cured = row[:cured] == "true"
      room_id = row[:room_id].to_i

      room = @room_repository.find(room_id)

      patient = Patient.new(id: id, name: row[:name], cured: cured, room: room)
      @next_id = @patients.last.id???? + 1
      @patients << patient

    end
  end
end