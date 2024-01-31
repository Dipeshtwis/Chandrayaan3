class UserInputHandler
  def self.get_commands
    puts "Enter commands (e.g., frubl):"
    gets.chomp.split('')
  end

  def self.execute_commands(commands, spacecraft)
  end
end
