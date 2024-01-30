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
  end
end