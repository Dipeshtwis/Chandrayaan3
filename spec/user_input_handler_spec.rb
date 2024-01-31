require_relative '../user_input_handler'

describe UserInputHandler do
  describe '#get_commands' do
    it 'returns an array of individual commands entered by the user' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")
      commands = UserInputHandler.get_commands
      expect(commands).to eq(['f', 'r', 'u', 'b', 'l'])
    end
  end
end
