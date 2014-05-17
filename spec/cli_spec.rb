require 'spec_helper'

describe Emojit::CLI do
  before do
    $stdout, $stderr = StringIO.new, StringIO.new
  end

  after() do
    $stdout, $stderr = STDOUT, STDERR
  end

  describe "#show" do
    context "with emoji name" do
      it "outputs icon with its unicode" do
        Emojit::CLI.start(['show', 'sunflower'])
        expect($stdout.string).to eq "\u{1F33B} U+1F33B\n"
      end
    end
  end
end