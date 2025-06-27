local items = {}

function items.check_turn_in(trade, trade_check)
    local handin_data = {};
    local index = 1;
    for key, value in pairs(trade) do
        if (key:findi("item")) then
            local item_id = value:GetID()
            if item_id ~= nil and item_id ~= 0 then
                if handin_data[item_id] ~= nil then
                    handin_data[item_id] = handin_data[item_id] + 1
                else
                    handin_data[item_id] = 1
                end
            end
        end
    end

    local item_data = {};
    for x = 1, 4 do
        local inst = trade["item" .. x];
        if (inst.valid) then
            item_data[x] = inst
        end
    end

    local required_data = {}
    for i = 1, 4 do
        local key = "item" .. i;
        local item_id = trade_check[key]
    
        if item_id ~= nil and item_id ~= 0 then
            if required_data[item_id] ~= nil then
                required_data[item_id] = required_data[item_id] + 1
            else
                required_data[item_id] = 1
            end
        end
    end

	local currencies = { "platinum", "gold", "silver", "copper" }

	-- Loop through each currency and check the corresponding key in trade_check
	for _, currency in ipairs(currencies) do
		if trade_check[currency] ~= nil and trade_check[currency] ~= 0 then
			-- Process the currency value
			local amount = trade_check[currency]
			required_data[currency] = amount
			-- You can perform your logic here, like adding to total or comparing values
		end
	end

	for _, currency in ipairs(currencies) do
		if trade[currency] ~= nil and trade[currency] ~= 0 then
			handin_data[currency] = trade[currency]
		end 
	end

    if (trade.self) then
        return trade.self:CheckHandin(trade.other, handin_data, required_data, item_data);
    else
        return false
    end
end

function items.return_items(npc, client, trade, text)
	npc:ReturnHandinItems(client);
end

function items.return_bot_items(bot, client, trade, text)
	text = text or true;
	local returned = false;
	for i = 1, 8 do
		local inst = trade["item" .. i];
		if (inst.valid) then
			client:PushItemOnCursor(inst);
			returned = true;
		end
	end
	
	local money = false;
	if (trade.platinum ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.gold ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.silver ~= 0) then
		returned = true;
		money = true;
	end
	
	if (trade.copper ~= 0) then
		returned = true;
		money = true;
	end
	
	if (money) then
		client:AddMoneyToPP(trade.copper, trade.silver, trade.gold, trade.platinum, true);
	end

	if (text and returned) then
		bot:OwnerMessage("I have no need for this, you can have it back.")
	end
	
	return returned;
end

function items.check_bot_turn_in(trade, trade_check)
	--create trade_return table == trade
	--shallow copy
	local trade_return = {};
	for key, value in pairs(trade) do
		trade_return[key] = value;
	end
	
	--for every item in trade_check check trade_return
		--if item exists in trade_return then 
			--remove that item from trade_return
		--else
			--failure
	for i = 1, 8 do
		local key = "item" .. i;
		if(trade_check[key] ~= nil and trade_check[key] ~= 0) then
			local found = false;
			for j = 1, 8 do
				local inst = trade_return["item" .. j];			
				if(inst.valid and trade_check[key] == inst:GetID()) then
					trade_return["item" .. j] = ItemInst();
					found = true;
					break;
				end
			end
			
			if(not found) then
				return false;
			end
		end
	end
	
	--convert our money into copper then check that we have enough then convert change back
	local trade_check_money = 0;
	local return_money = 0;
	
	if(trade_check["platinum"] ~= nil and trade_check["platinum"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["platinum"] * 1000);
	end
	
	if(trade_check["gold"] ~= nil and trade_check["gold"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["gold"] * 100);
	end
	
	if(trade_check["silver"] ~= nil and trade_check["silver"] ~= 0) then
		trade_check_money = trade_check_money + (trade_check["silver"] * 10);
	end
	
	if(trade_check["copper"] ~= nil and trade_check["copper"] ~= 0) then
		trade_check_money = trade_check_money + trade_check["copper"];
	end
	
	return_money = return_money + trade_return["platinum"] * 1000 + trade_return["gold"] * 100;
	return_money = return_money + trade_return["silver"] * 10 + trade_return["copper"];
	
	if(return_money < trade_check_money) then
		return false;
	else
		return_money = return_money - trade_check_money;
	end
	
	--replace trade with trade_return
	trade.item1 = trade_return.item1;
	trade.item2 = trade_return.item2;
	trade.item3 = trade_return.item3;
	trade.item4 = trade_return.item4;
	trade.item5 = trade_return.item5;
	trade.item6 = trade_return.item6;
	trade.item7 = trade_return.item7;
	trade.item8 = trade_return.item8;
	
	trade.platinum = math.floor(return_money / 1000);
	return_money = return_money - (trade.platinum * 1000);
	
	trade.gold = math.floor(return_money / 100);
	return_money = return_money - (trade.gold * 100);
	
	trade.silver = math.floor(return_money / 10);
	return_money = return_money - (trade.silver * 10);
	
	trade.copper = return_money;
	return true;
end
	
return items;