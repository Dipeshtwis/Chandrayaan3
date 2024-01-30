class Chandrayaan3
  attr_accessor :position, :direction

  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def move_forward
    case @direction
      when 'N' then @position[1] += 1
    end
  end

  def turn_right
    
  end
end