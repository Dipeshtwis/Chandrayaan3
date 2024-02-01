require_relative './chandrayaan3'

spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
spacecraft.run

puts "Final Position: #{spacecraft.position}"
puts "Final Direction: #{spacecraft.direction}"