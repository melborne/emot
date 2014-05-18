require 'spec_helper'

describe Emot do
  it 'has a version number' do
    expect(Emot::VERSION).not_to be nil
  end

  describe ".icon" do
    it "returns icon for given name" do
      expect(Emot.icon :apple).to eq "\u{1F34E}"
      expect(Emot.icon 'airplane').to eq "\u{2708}\u{FE0F}"
      expect(Emot.icon :hello_world).to be_nil
    end
  end

  describe ".unicode" do
    it "returns unicode in string" do
      expect(Emot.unicode 'apple').to eq "U+1F34E"
      expect(Emot.unicode :airplane).to eq "U+2708 U+FE0F"
      expect(Emot.unicode :hello_world).to be_nil
    end
  end

  describe ".list" do
    it "returns emoji list" do
      list = Emot.list
      expect(list[:"+1"]).to eq ["\u{1F44D}", "U+1F44D"]
      expect(list[:airplane]).to eq ["\u{2708}\u{FE0F}", "U+2708 U+FE0F"]
      expect(list.first).to eq [:hash, ["\u{23}\u{FE0F}\u{20E3}", "U+23 U+FE0F U+20E3"]]
    end
  end
end

describe Symbol do
  describe "#~" do
    it "returns emoji string" do
      expect(~:smile).to eq "\u{1F604}"
      expect(~:jack_o_lantern).to eq "\u{1F383}"
    end

    it "returns emoji mixed string" do
      expect(~:'dango is better than sunflower').to eq "\u{1F361} is better than \u{1F33B}"
      expect(~:'fish + hocho => sushi').to eq "\u{1F41F} + \u{1F52A} => \u{1F363}"
    end

    it "escape emojiaze with prefix '.'" do
      expect(~:'jp + .us + .fr').to eq "\u{1F1EF}\u{1F1F5} + us + fr"
    end
  end
end
