require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    context 'runs correctly' do
      it 'when name is +5 Dexterity Vest' do
        items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 19
      end

      it 'when name is Aged Brie' do
        items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 1
        expect(items[0].quality).to eq 1
      end

      it 'when name is Elixir of the Mongoose' do
        items = [Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7)]
        GildedRose.new(items).update_quality()

        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 6
      end

      it 'Sulfuras, Hand of Ragnaros' do
        items =
          [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
          Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
        GildedRose.new(items).update_quality()

        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 80

        expect(items[1].sell_in).to eq -1
        expect(items[1].quality).to eq 80
      end

      it 'when name is Backstage passes to a TAFKAL80ETC concert' do
        items =
          [ Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
          Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
          Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49)]

        GildedRose.new(items).update_quality()

        expect(items[0].sell_in).to eq 14
        expect(items[0].quality).to eq 21

        expect(items[1].sell_in).to eq 9
        expect(items[1].quality).to eq 50

        expect(items[2].sell_in).to eq 4
        expect(items[2].quality).to eq 50
      end

      # This Conjured item does not work properly yet
      it 'when name is Conjured Mana Cake' do
        items = [Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)]
        GildedRose.new(items).update_quality()

        expect(items[0].sell_in).to eq 2
        expect(items[0].quality).to eq 5
      end
    end
  end
end
