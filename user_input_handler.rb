class UserInputHandler
  def self.get_commands
    puts "Enter commands (e.g., frubl):"
    gets.chomp.split('')
  end

  def self.execute_commands(commands, spacecraft)
    commands.each { |command| execute_command(command, spacecraft) }
  end

  private

  def self.execute_command(command, spacecraft)
    case command
      when 'f' then spacecraft.move_forward
      when 'r' then spacecraft.turn_right
      when 'u' then spacecraft.rotate_up
      when 'b' then spacecraft.move_backward
      when 'l' then spacecraft.turn_left
      when 'd' then spacecraft.rotate_down
    end
  end
end
