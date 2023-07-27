class Patient
  attr_accessor :room
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end

  def cure!
    @cured = true
  end

  def cured?
    @cured
  end
end