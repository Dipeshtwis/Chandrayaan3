require_relative '../chandrayaan3'

describe Chandrayaan3 do
  describe '#initialize' do
    it 'initializes with a starting position and direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      expect(spacecraft.position).to eq([0, 0, 0])
      expect(spacecraft.direction).to eq('N')
    end
  end

  describe '#move_forward' do
    it 'moves forward in the current direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.move_forward
      expect(spacecraft.position).to eq([0, 1, 0])
      expect(spacecraft.direction).to eq('N')
    end
  end

  describe '#turn_right' do
    it 'turns the spacecraft 90 degrees to the right' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('E')
    end

    it 'turns 180 degrees to the right as it calls two times' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_right
      spacecraft.turn_right
      expect(spacecraft.direction).to eq('S')
    end
  end

  describe '#move_backward' do
    it 'moves backward in the current direction' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.move_backward
      expect(spacecraft.position).to eq([0, -1, 0])
    end
  end

  describe '#turn_left' do
    it 'turns the spacecraft 90 degrees to the left' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('W')
    end

    it 'turns 180 degrees to the left as it calls two times' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.turn_left
      spacecraft.turn_left
      expect(spacecraft.direction).to eq('S')
    end
  end

  describe '#rotate_up' do
    it 'rotates the spacecraft upwards' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_up
      expect(spacecraft.direction).to eq('U')
    end
  end

  describe '#rotate_down' do
    it 'rotates the spacecraft downwards' do
      spacecraft = Chandrayaan3.new([0, 0, 0], 'N')
      spacecraft.rotate_down
      expect(spacecraft.direction).to eq('D')
    end
  end
end