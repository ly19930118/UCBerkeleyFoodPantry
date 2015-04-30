Given /the following inventory items exists/ do |inven_item|
	InventoryItem.create(:name => inven_item["item"], :stock => inven_item["quantity"], :max_per_order => inven_item["maximum"])
end
