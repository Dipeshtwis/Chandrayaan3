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
    @direction = case [@original_direction, @direction]
                 when ['N', 'U'], ['N', 'N'], ['N', 'D'] then 'E'
                 when ['E', 'U'], ['E', 'E'], ['E', 'D'] then 'S'
                 when ['S', 'U'], ['S', 'S'], ['S', 'D'] then 'W'
                 when ['W', 'U'], ['W', 'W'], ['W', 'D'] then 'N'
                 else @direction
                 end
    @original_direction = @direction
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