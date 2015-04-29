	def update_quality(items)
		items.each do |item|
			find_updater(item)
		end
	end

	def find_updater(item)
		case item.name
		when "Backstage passes to a TAFKAL80ETC concert"
			update_for_backstage(item)
		when "Aged Brie"
			update_for_aged_brie(item)
		when "Conjured Mana Cake"
			update_for_cake(item)				
		when "Sulfuras, Hand of Ragnaros"
			#do nothing
		else
			do_the_common_update(item)
		end
	end

	def do_the_common_update(item)
		qual = item.quality
		sell_in = item.sell_in - 1
		if qual > 0
			if sell_in < 0
				item.quality -= 2
			else
				item.quality -= 1
			end
		end
		item.sell_in = sell_in
	end



	def update_for_aged_brie(item) #needs refactoring
		qual = item.quality		
		if qual < 50
			item.quality += 1
			sell_in = item.sell_in - 1
			if sell_in < 0 && item.quality < 50
				item.quality += 1
			end			
		end	
		item.sell_in = item.sell_in - 1	
	end

	def update_for_backstage(item)
		#for quality
		sell_in = item.sell_in

		if item.quality < 50
			if sell_in > 10
				item.quality += 1
			elsif sell_in > 5
				item.quality += 2
			elsif sell_in > 0
				item.quality +=3													
			end
		end
		item.sell_in -= 1
		#for sell_in
		if item.sell_in < 0
			item.quality = 0
		end
	end

	def update_for_cake(item)
		qual = item.quality
		item.sell_in = item.sell_in - 1
		if qual > 0
			if item.sell_in < 0
				item.quality -= 4
			else
				item.quality -= 2
			end
		end		
	end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]




