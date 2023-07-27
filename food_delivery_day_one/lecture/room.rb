class Room
  attr_accessor :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @capacity = attributes[:capacity]
    @patients = []
  end

  def add_patient(patient)
    if full?
      raise StandardError, "Room is full"
    else
        
      patient.room = self
      @patients << patient
    end
  end

  def full?
    @patients.size == @capacity
  end
end