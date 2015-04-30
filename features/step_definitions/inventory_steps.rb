Given /the following inventory items exists/ do |inven_table|
	inven_table.hashes.each do |item|
		InventoryItem.create!(name: item["name"], stock: item["quantity"], max_per_order: item["maximum"])
	end
end
