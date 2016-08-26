class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
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

  def update_quality
    case name
    when '+5 Dexterity Vest' then
      @sell_in = sell_in - 1
      @quality = quality - 1
    when 'Aged Brie' then
      @sell_in = sell_in - 1
      if quality != 0
        @quality = quality - 1
      else
        @quality = 1
      end
    when 'Elixir of the Mongoose' then
      @sell_in = sell_in - 1
      @quality = quality - 1
    when 'Sulfuras, Hand of Ragnaros'
      # do nothing
    when 'Backstage passes to a TAFKAL80ETC concert' then
      @sell_in = sell_in - 1
      @quality = quality + 1
    when 'Conjured Mana Cake' then
      @sell_in = sell_in - 1
      @quality = quality - 1
    end
  end

  def to_s()
    "#{name}, #{sell_in}, #{quality}"
  end
end

class DexterityVestItem < Item
  def update_quality
    sell_in = sell_in - 1
    quality = quality - 1
  end
end

class AgedBrieItem < Item
  def update_quality
    sell_in = sell_in - 1
    if quality != 0
      quality = quality - 1
    else
      quality = 1
    end
  end
end

class ElixirOfTheMongooseItem < Item
  def update_quality
    sell_in = sell_in - 1
    quality = quality - 1
  end
end

class SulfurasHandofRagnarosItem < Item
  def update_quality
    # do nothing
  end
end

class BackstagePassesItem < Item
  def update_quality
    sell_in = sell_in - 1
    quality = quality + 1
  end
end
