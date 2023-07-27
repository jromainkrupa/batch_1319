require_relative "patient"
require_relative "room"
require "amazing_print"

jaune = Room.new(name: "jaune", capacity: 2)

jean = Patient.new(name: 'jean')
hadrien = Patient.new(name: 'hadrien')
camelia = Patient.new(name: 'camelia')

# p jaune.patients.size

jaune.add_patient(jean)
# p jaune.full?

jaune.add_patient(hadrien)
# p jaune.full?
begin
  jaune.add_patient(camelia)
rescue StandardError => e
  puts "Erreur: #{e.message}"
end


puts 'coucouu'
# instance de Room qui est la jaune
# puts "la chambre de camelia"
# p camelia.room
# instance de Room qui est la jaune

