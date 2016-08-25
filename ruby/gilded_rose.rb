class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when '+5 Dexterity Vest' then
        item.sell_in = item.sell_in - 1
        item.quality = item.quality - 1
      when 'Aged Brie' then
        item.sell_in = item.sell_in - 1
        if item.quality != 0
          item.quality = item.quality - 1
        else
          item.quality = 1
        end
      when 'Elixir of the Mongoose' then
        item.sell_in = item.sell_in - 1
        item.quality = item.quality - 1
      when 'Sulfuras, Hand of Ragnaros'
        # do nothing
      when 'Backstage passes to a TAFKAL80ETC concert' then
        item.sell_in = item.sell_in - 1
        item.quality = item.quality + 1
      when 'Conjured Mana Cake' then
        item.sell_in = item.sell_in - 1
        item.quality = item.quality - 1
      end
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

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
