require_relative '../chandrayaan_script'

describe 'chandrayaan_script' do
  it 'prints the final position and direction' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("frubl\n")

    output = capture_stdout { load 'chandrayaan_script.rb' }

    # Check the final position and direction in the output
    expect(output).to include("Final Position: [0, 1, -1]")
    expect(output).to include("Final Direction: N")
  end

  private

  # Helper method to capture stdout
  def capture_stdout(&block)
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end