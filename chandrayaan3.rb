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
    @direction = case @direction
                 when 'N' then 'E'
                 when 'E' then 'S'
                 when 'S' then 'W'
                 when 'W' then 'N'
                 else @direction
                 end
  end

  def move_backward
    case @direction
      when 'N' then @position[1] -= 1
    end
  end

  def turn_left
    @direction = case @direction
                 when 'N' then 'W'
                 when 'E' then 'N'
                 when 'S' then 'E'
                 when 'W' then 'S'
                 else @direction
                 end
  end

  def rotate_up
    @direction = 'U'
  end

  def rotate_down
  end
end