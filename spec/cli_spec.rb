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

    context "without emoji name" do
      it "outputs all emoji with name and unicode" do
        Emojit::CLI.start(['show'])
        expect($stdout.string).to match /hash.*sunflower.*1F618.*bathtub/
      end

      it "outputs all emoji with name" do
        Emojit::CLI.start(['show', '--only', 'name'])
        expect($stdout.string).to match /hash.*sunflower.*bathtub/
        expect($stdout.string).not_to match /1F618/
      end
    end
  end
end
