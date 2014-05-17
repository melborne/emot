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
        expect($stdout.string).to eq "\u{1F33B}  sunflower (U+1F33B)\n"
      end

      it "outputs no emoji message" do
        Emojit::CLI.start(['show', 'hello'])
        expect($stdout.string).to eq "No emoji for 'hello'\n"
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

  describe "#icons" do
    it "outputs all emoji icons" do
      Emojit::CLI.start(['icons'])
      expect($stdout.string).to match /\u{1F33B}/
      expect($stdout.string).not_to match /sunflower/
      expect($stdout.string).not_to match /1F33B/
    end
  end

  describe "#names" do
    it "outputs all available names for emojis" do
      Emojit::CLI.start(['names'])
      expect($stdout.string).to match /hash.*sunflower.*bathtub/
      expect($stdout.string).not_to match /\u{1F33B}/
      expect($stdout.string).not_to match /1F33B/
    end
  end
end
