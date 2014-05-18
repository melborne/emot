require 'spec_helper'

describe Emot::CLI do
  before do
    $stdout, $stderr = StringIO.new, StringIO.new
  end

  after() do
    $stdout, $stderr = STDOUT, STDERR
  end

  describe "#show" do
    context "with emoji name" do
      it "outputs icon with its unicode" do
        Emot::CLI.start(['show', 'sunflower'])
        expect($stdout.string).to eq "\u{1F33B}  \e[32msunflower\e[0m (U+1F33B)\n"
      end

      it "outputs no emoji message" do
        Emot::CLI.start(['show', 'hello'])
        expect($stdout.string).to eq "No emoji for 'hello'\n"
      end
    end

    context "without emoji name" do
      it "outputs all emoji with name and unicode" do
        Emot::CLI.start(['show'])
        expect($stdout.string).to match /hash.*sunflower.*1F618.*bathtub/m
      end

      it "outputs all emoji with name" do
        Emot::CLI.start(['show', '--only', 'name'])
        expect($stdout.string).to match /hash.*sunflower.*bathtub/m
        expect($stdout.string).not_to match /1F618/
      end
    end
  end

  describe "#icons" do
    it "outputs all emoji icons" do
      Emot::CLI.start(['icons'])
      expect($stdout.string).to match /\u{1F33B}/
      expect($stdout.string).not_to match /sunflower/
      expect($stdout.string).not_to match /1F33B/
    end
  end

  describe "#names" do
    it "outputs all available names for emojis" do
      Emot::CLI.start(['names'])
      expect($stdout.string).to match /hash.*sunflower.*bathtub/m
      expect($stdout.string).not_to match /\u{1F33B}/
      expect($stdout.string).not_to match /1F33B/
    end
  end
end
