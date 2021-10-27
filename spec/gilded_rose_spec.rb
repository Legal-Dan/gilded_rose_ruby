require 'gilded_rose'

describe GildedRose do

  describe "#new item" do
    it "records the name value" do
      items = [Item.new("foo", 1, 2)]
      expect(items[0].name).to eq "foo"
    end

    it "records the sell in value" do
      items = [Item.new("foo", 1, 2)]
      expect(items[0].sell_in).to eq 1
    end
    it "records the quality value" do
      items = [Item.new("foo", 1, 2)]
      expect(items[0].quality).to eq 2
    end
  end

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "sell in value by 1" do
      items = [Item.new("foo", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end

    it "does not change the name" do
      items = [Item.new("foo", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end
  end
end


