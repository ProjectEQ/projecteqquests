-- Newer Cultural Tradeskill Armor Quest -- Dwarf

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'Gaa!  Look at that shoddy piece of work yer wearing!  You call that [armor]?  I've seen finer craftsmanship hanging off the corpse of a rock-pickin' goblin!'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'Bah!  See how you are?!  All sloppy and ragged!  Now look at me!  A respectable dwarf, standing tall and proud in bright mail.  The way Brell intended!  To any self-respectin' dwarf, good armor is more important than good ale!  Your ale won't last, but your armor is forever!  Remember that, Droldolap.  Now if you [want] to be a self-respecting dwarf, let me know.  I've also got a couple kits of [adornments] to be used by someone in decent armor, not someone like you.  But if yer interested in them I might tell you about them.  Otherwise carry on with your lollygagging!'");
		elseif e.message:findi("want") then
			e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'Well then, I can make you a pattern book for some decent armor, but first I'll need some zombie skin and a bit of grave mold from the Estate of Unrest. I can use those to create the cover and ink for the book. I'll also need some of the battle beads from Crushbone to help bind the book and a rotting orc tooth to complete the ink. Now get going, ya filthy roustabout!'");
		elseif e.message:findi("adornments") then
			e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'You see, these adornments aren't just fer lookin at.  No, these can work wonders when you combine them with the patterns that I have.  You'd surely be a foolish one if you thought that I'd ever be makin somthin fer armor that was just fer looks.  Now I'm willing to part with some of these kits but you'd have to [prove your mettle] first.'");
		elseif e.message:findi("mettle") then
			e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'Let's see here... I know, since yer an adventurin type, I'll send you on some adventures.  I'll even be nice about it.  You've got yer choice of any of the tasks I have offered you. Take this impression book and make impressions of certain parts of critters that you slay in your adventurous deeds.  This magical book can make impression of objects with depth to them or just of the pattern on the surface of an object.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Yar Shiverbrow says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
	if eq.is_current_expansion_dragons_of_norrath() then
		if player_level >= 15 then
			table.insert(task_array, 5784); -- Task: Blessed Impressions -- Variant C
		end

		if player_level >= 35 then
			table.insert(task_array, 5787); -- Task: Revered Impressions -- Variant C
		end

		if player_level >= 55 then
			table.insert(task_array, 5790); -- Task: Sacred Impressions -- All Races
		end

		if player_level >= 65 then
			table.insert(task_array, 5791); -- Task: Eminent Impressions -- All Races
		end
	end

	-- Below are not officially supported by EQEmu currently
	if eq.is_current_expansion_the_serpents_spine() and player_level >= 70 then
		table.insert(task_array, 5792); -- Task: Exalted Impressions -- All Races
	end

	if eq.is_current_expansion_secrets_of_faydwer() and player_level >= 75 then
		table.insert(task_array, 5793); -- Task: Sublime Impressions -- All Races
	end

	if eq.is_current_expansion_underfoot() and player_level >= 85 then
		table.insert(task_array, 6955); -- Task: Venerable Impressions -- All Races
	end

	if eq.is_current_expansion_house_of_thule() and player_level >= 85 then
		table.insert(task_array, 7070); -- Task: Illustrious Impressions -- All Races
	end

	if eq.is_current_expansion_veil_of_alaris() and player_level >= 85 then
		table.insert(task_array, 7071); -- Task: Numinous Impressions -- All Races
	end

	if eq.is_current_expansion_veil_of_alaris() and player_level >= 85 then
		table.insert(task_array, 7078); -- Task: Transcendent Impressions -- All Races
	end

	if eq.is_current_expansion_depths_of_darkhollow() then
		table.insert(task_array, 10044); -- Task: Darkhollow Geode -- All Races
	end
end

function event_task_accepted(e)
	-- Supported
	if e.task_id == 5784 or e.task_id == 5785 or e.task_id == 5786 then -- Blessed Impressions A/B/C
		e.other:SummonItem(34997) -- Item: Blessed Impression Book
	elseif e.task_id == 5787 or e.task_id == 5788 or e.task_id == 5789 then -- Revered Impressions A/B/C
		e.other:SummonItem(34998) -- Item: Revered Impression Book
	elseif e.task_id == 5790 then -- Sacred Impressions
		e.other:SummonItem(34999) -- Item: Sacred Impression Book
	elseif e.task_id == 5791 then -- Eminent Impressions
		e.other:SummonItem(35000) -- Item: Eminent Impression Book
	-- Not Supported
	elseif e.task_id == 5792 then -- Exalted Impressions
		e.other:SummonItem(35017) -- Item: Exalted Impression Book
	elseif e.task_id == 5793 then -- Sublime Impressions
		e.other:SummonItem(35018) -- Item: Sublime Impression Book
	elseif e.task_id == 6955 then -- Venerable Impressions
		e.other:SummonItem(88388) -- Item: Venerable Impression Book
	elseif e.task_id == 7070 then -- Illustrious Impressions
		e.other:SummonItem(17835) -- Item: Illustrious Impression Book
	elseif e.task_id == 7071 then -- Numinous Impressions
		e.other:SummonItem(54449) -- Item: Numinous Impression Book
	elseif e.task_id == 7078 then -- Transcendent Impressions
		e.other:SummonItem(55727) -- Item: Transcendent Impression Book
	end
end

function event_trade(e)
	local item_lib = require("items");

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		-- Supported
		if e.other:IsTaskActivityActive(5784,4) and item_lib.check_turn_in(e.trade, {item1 = 34997}) then -- Blessed Impression Book
			e.other:UpdateTaskActivity(5784,4,1);
			e.other:QuestReward(e.self,{itemid = 38423}); -- Item: Blessed Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(5787,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5787,4,1);
			e.other:QuestReward(e.self,{itemid = 38424}); -- Item: Revered Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38425}); -- Item: Sacred Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38426}); -- Item: Eminent Book of Dwarven Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35745}); -- Item: Exalted Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35746}); -- Item: Sublime Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49962}); -- Item: Venerable Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123414}); -- Item: Illustrious Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112548}); -- Item: Numinous Book of Dwarven Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134597}); -- Item: Transcendent Book of Dwarven Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
