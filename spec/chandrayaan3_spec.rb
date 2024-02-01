require_relative '../chandrayaan3'

describe Chandrayaan3 do
  describe '#initialize' do
    it 'initializes with a starting position and direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end
  end

  describe '#run' do
    it 'gets commands from UserInputHandler and executes them' do
      user_input_handler = double('UserInputHandler')
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')

      allow(UserInputHandler).to receive(:get_commands).and_return(['f', 'r', 'u'])
      expect(UserInputHandler).to receive(:execute_commands).with(['f', 'r', 'u'], spacecraft)

      spacecraft.run
    end
  end

  describe '#move_forward' do
    it 'moves forward in the north direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([0, 1, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'moves forward in the south direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([0, -1, 0])
    end

    it 'moves forward in the east direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([1, 0, 0])
    end

    it 'moves forward in the west direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([-1, 0, 0])
    end

    it 'moves forward in the up direction' do
        spacecraft = Chandrayaan3.new([0, 0, 0], 'U')
        spacecraft.move_forward
        expect(spacecraft.position).to eq([0, 0, 1])
    end

    it 'moves forward in the down direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'D')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([0, 0, -1])
    end
  end

  describe '#turn_right' do
    it 'turns to east from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to south from north if it turn two times' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_right
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to west from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to south from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to north from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to east after rotating up from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to south after rotating up from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to west after rotating up from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to north after rotating up from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to east after rotating down from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to south after rotating down from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to west after rotating down from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to north after rotating down from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to north after rotating up and down from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_up
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to north after rotating down and up from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_down
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to north after rotating up multiple times from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_up
      spacecraft.rotate_up
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to north after rotating down multiple times from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_down
      spacecraft.rotate_down
      spacecraft.turn_right

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end
  end

  describe '#move_backward' do
    it 'moves backward in the north direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([0, -1, 0])
    end

    it 'moves backward in the south direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([0, 1, 0])
    end

    it 'moves backward in the east direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([-1, 0, 0])
    end

    it 'moves backward in the west direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([1, 0, 0])
    end

    it 'moves backward in the up direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'U')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([0, 0, -1])
    end

    it 'moves backward in the down direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'D')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([0, 0, 1])
    end
  end

  describe '#turn_left' do
    it 'turns to west from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to south from north if it turn two times' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_left
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to east from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to north from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to south from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to east after rotating up from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_up
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to south after rotating up from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.rotate_up
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to west after rotating up from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.rotate_up
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to north after rotating up from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_up
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('S')
    end

    it 'turns to east after rotating down from north' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_down
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns to south after rotating down from east' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'E')
      spacecraft.rotate_down
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end

    it 'turns to west after rotating down from south' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'S')
      spacecraft.rotate_down
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns to north after rotating down from west' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'W')
      spacecraft.rotate_down
      spacecraft.turn_left

      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('S')
    end
  end

  describe '#rotate_up' do
    it 'rotates the spacecraft upwards' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_up
      expect(spacecraft.direction).to eq('U')
    end

    it 'keep track from which direction spacecraft rotates' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_up
      expect(spacecraft.direction).to eq('U')
      expect(spacecraft.original_direction).to eq('N')
    end
  end

  describe '#rotate_down' do
    it 'rotates the spacecraft downwards' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_down
      expect(spacecraft.direction).to eq('D')
    end

    it 'keep track from which direction spacecraft rotates' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_down
      expect(spacecraft.direction).to eq('D')
      expect(spacecraft.original_direction).to eq('N')
    end
  end
end