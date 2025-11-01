function event_say(e)
    local client = e.other
    local bag_id = 60017403
    local bag_slot = -1

    -- Look for the bag in slots 22–29
    for slot = 22, 29 do
        if client:GetItemIDAt(slot) == bag_id then
            bag_slot = slot
            break
        end
    end

    if e.message:findi("hail") then
        if bag_slot == -1 then
            e.self:Say("Greetings, adventurer. I don’t see your special sell bag (ID " .. bag_id .. "). Place it in your main inventory and hail me again.")
            return
        end

        local bag_capacity = 80
        local base_slot = 1920 + ((bag_slot - 22) * bag_capacity)

        local item_count = 0
        local total_value = 0

        for sub_slot = 0, bag_capacity - 1 do
            local real_slot = base_slot + sub_slot
            local item_id = client:GetItemIDAt(real_slot)

            if item_id and item_id > 0 then
                local row = eq.database_query("SELECT price FROM items WHERE id = " .. item_id .. " LIMIT 1")
                if row and row[1] and tonumber(row[1]["price"]) > 0 then
                    item_count = item_count + 1
                    total_value = total_value + tonumber(row[1]["price"])
                end
            end
        end

        if item_count > 0 then
            e.self:Say("Ah, I see you have " .. item_count .. " sellable items in your bag worth " .. total_value .. " platinum. Would you like me to [buy everything]?")
        else
            e.self:Say("Your special bag is empty, or contains nothing worth buying.")
        end
    end

    if e.message:findi("buy everything") then
        if bag_slot == -1 then
            e.self:Say("I cannot find your sell bag. Please place it in your main inventory.")
            return
        end

        local bag_capacity = 80
        local base_slot = 1920 + ((bag_slot - 22) * bag_capacity)

        local total_value = 0

        for sub_slot = 0, bag_capacity - 1 do
            local real_slot = base_slot + sub_slot
            local item_id = client:GetItemIDAt(real_slot)

            if item_id and item_id > 0 then
                local row = eq.database_query("SELECT price FROM items WHERE id = " .. item_id .. " LIMIT 1")
                if row and row[1] and tonumber(row[1]["price"]) > 0 then
                    total_value = total_value + tonumber(row[1]["price"])
                    client:DeleteItemInInventory(real_slot, true)
                end
            end
        end

        if total_value > 0 then
            e.self:Say("All done! I have purchased everything in your bag for " .. total_value .. " platinum.")
            client:AddMoneyToPP(total_value, 0, 0, 0, true)
        else
            e.self:Say("Your bag contained nothing worth buying.")
        end
    end
end
