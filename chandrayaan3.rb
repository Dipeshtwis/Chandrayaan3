class Chandrayaan3
  attr_accessor :position, :direction, :original_direction

  def initialize(position, direction)
    @position = position
    @direction = direction

    @original_direction = direction
  end

  def move_forward
    case @direction
      when 'N' then @position[1] += 1
      when 'S' then @position[1] -= 1
      when 'E' then @position[0] += 1
      when 'W' then @position[0] -= 1
      when 'U' then @position[2] += 1
      when 'D' then @position[2] -= 1
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
      when 'S' then @position[1] += 1
      when 'E' then @position[0] -= 1
      when 'W' then @position[0] += 1
      when 'U' then @position[2] -= 1
      when 'D' then @position[2] += 1
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
    @original_direction = @direction
    @direction = 'U'
  end

  def rotate_down
    @original_direction = @direction
    @direction = 'D'
  end
end