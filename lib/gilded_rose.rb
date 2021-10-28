class GildedRose
  EXCEPTIONS = ["Aged Brie", "Sulfuras", "Backstage Passes", "Conjured"]
  
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      standard_item?(item) ? Update.standard_update(item) : Update.update_exception(item)
    end
  end

  def standard_item?(item)
    EXCEPTIONS.each do |exception|
      return false if item.name.include? exception
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end

class Update
  def self.standard_update(item)
    item.quality -= 2 if item.sell_in <= 0
    item.quality -= 1 if item.sell_in > 0
    item.quality = 0 if item.quality < 0
    item.sell_in -= 1
  end

  def self.update_exception(item)
    if item.name.include?("Aged Brie")
      item.sell_in -= 1
      item.quality += 1      
    elsif item.name.include?("Backstage pass")
      puts "Back: #{item.name}"
    elsif item.name.include?("Conjured")
      puts "Conjure: #{item.name}"
    end
    item.quality = 50 if item.quality > 50 unless item.name.include?("Sulfuras")
  end
end
