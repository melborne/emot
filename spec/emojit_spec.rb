require 'spec_helper'

describe Emojit do
  it 'has a version number' do
    expect(Emojit::VERSION).not_to be nil
  end

  describe ".icon" do
    it "returns icon for given name" do
      expect(Emojit.icon :apple).to eq "\u{1F34E}"
      expect(Emojit.icon 'airplane').to eq "\u{2708}\u{FE0F}"
      expect(Emojit.icon :hello_world).to be_nil
    end
  end

  describe ".unicode" do
    it "returns unicode in string" do
      expect(Emojit.unicode 'apple').to eq "U+1F34E"
      expect(Emojit.unicode :airplane).to eq "U+2708 U+FE0F"
      expect(Emojit.unicode :hello_world).to be_nil
    end
  end

  describe ".list" do
    it "returns emoji list" do
      list = Emojit.list
      expect(list[:"+1"]).to eq ["\u{1F44D}", "U+1F44D"]
      expect(list[:airplane]).to eq ["\u{2708}\u{FE0F}", "U+2708 U+FE0F"]
      expect(list.first).to eq [:hash, ["\u{23}\u{FE0F}\u{20E3}", "U+23 U+FE0F U+20E3"]]
    end
  end
end
