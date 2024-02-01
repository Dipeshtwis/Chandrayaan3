require_relative '../user_input_handler'

describe UserInputHandler do
  describe '#get_commands' do
    it 'returns an array of individual commands entered by the user' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")
      commands = UserInputHandler.get_commands
      expect(commands).to eq(['f', 'r', 'u', 'b', 'l'])
    end
  end

  describe '#execute_commands' do
    it 'executes the given commands on the spacecraft' do
      spacecraft = double('Chandrayaan3')
      commands = ['f', 'r', 'u']
      expect(spacecraft).to receive(:move_forward).once
      expect(spacecraft).to receive(:turn_right).once
      expect(spacecraft).to receive(:rotate_up).once
      UserInputHandler.execute_commands(commands, spacecraft)
    end

    it 'executes the given commands on the spacecraft' do
      spacecraft = double('Chandrayaan3')
      commands = ['b', 'l', 'd']
      expect(spacecraft).to receive(:move_backward).once
      expect(spacecraft).to receive(:turn_left).once
      expect(spacecraft).to receive(:rotate_down).once
      UserInputHandler.execute_commands(commands, spacecraft)
    end
  end
end
