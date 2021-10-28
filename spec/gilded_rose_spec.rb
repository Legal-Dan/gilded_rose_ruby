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

    it "quality goes down by 1 per day" do
      items = [Item.new("foo", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "quality degrades twice as fast after the sell by date" do
      items = [Item.new("foo", 0, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end

    it "cannot have a negative quality value" do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "increases the quality value for Aged Brie" do
      items = [Item.new("Aged Brie", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end

    it "cannot have a quality greater than 50" do
      items = [Item.new("Aged Brie", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it "Sulfuras sell in and quality values do not decrease" do
      items = [Item.new("Sulfuras", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 80
    end

    it "increases the quality value for Backstage passes" do
      items = [Item.new("Backstage passes", 20, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 3
    end

    it "increases the quality value by 2 for Backstage passes with <= 10 days left" do
      items = [Item.new("Backstage passes", 9, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end

    it "increases the quality value by 3 for Backstage passes with <= 5 days left" do
      items = [Item.new("Backstage passes", 5, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 5
    end

    it "drops the quality of Backstage passes with < 0 days left to 0" do
      items = [Item.new("Backstage passes", 0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "Conjured items drop in quality by 2" do
      items = [Item.new("Conjured", 1, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end


