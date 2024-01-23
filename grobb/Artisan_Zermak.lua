-- Newer Cultural Tradeskill Armor Quest -- Troll

local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.other:GetBaseRace() == e.self:GetBaseRace() then
		if e.message:findi("hail") then
			e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Yer looking a might bit uncomfortable dere, "..e.other:GetCleanName() ..".  Whadda matter?  Your [armor] chafing you?'");
		elseif e.message:findi("armor") then
			e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Tell me 'bout it.  Da only armor we trolls ever get is whats we can pull from our victims.  Nothing fits and we're always clatt'ring around.  Tell ye what though, the last stint I did was a job for dem dark elves, marching with the armies of Lanys T'Vyl.  Vile, that woman is, but I'll say dis for 'er -- she fixed us up with some pretty good battle mail.  It's easier to wear dan da trash you're wearin' and it's lighter dan anything one of us could craft.  You should fix yourself up with some of dis [design].'");
		elseif e.message:findi("design") then
			e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Heh heh.  Before I left Lany's army, I stole da armor patterns made fo' us troll troops.  Had to bash dat dark elf artisan good to get him to let go, but I got 'em!  Tell you what -- I can't give away my only copy, but if you bring me da [ingredients] to make another pattern book, I can fix you up with a book of yer own. Or mebbe you already got a book and you need sometin [more].'");
		elseif e.message:findi("ingredients") then
			e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Good.  Good.  First I need a fire beetle carapace for the cover, den a patch of zombie skin for the pages, a golden bandit tooth for the clasp, and a lion tail for the spine.  I hear dese ting can be found in the Western Karanas so bring dem to me and I make a pattern book for you, ya?'");
		elseif e.message:findi("more") then
			e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Da armor in dat book is nice an' all, but dey could be better. Mebbe I give you patterns for reinforcements if you do some tings to prove yerself. I got some other patterns, but you prolly not ready for all of dem yet. I give you patterns dependin on what you can do.  I give you many tasks, you choose which you do.  When you do tasks you get impressions of tings.  Da tings you choose show if you good at seeing patterns and symbols.  Da book magic so you not worry about weird tings dat may inspire you.'");
			eq.task_selector(task_array);
		end
	else
		e.other:Message(MT.NPCQuestSay, "Artisan Zermak says, 'Greetings, "..e.other:GetCleanName() ..".  I'm afraid I do not have time to talk at the moment.  Please leave me to my work.  If your looking for work yourself, I suggest you return to your home city and seek out your own kind.'");
	end
end

function table_setup(e)
	local player_level = e.other:GetLevel();
	task_array = {}; -- Clear Table

	-- Below are fully supported by EQEmu
	if eq.is_current_expansion_dragons_of_norrath() then
		if player_level >= 15 then
			table.insert(task_array, 5786); -- Task: Blessed Impressions -- Variant A
		end

		if player_level >= 35 then
			table.insert(task_array, 5789); -- Task: Revered Impressions -- Variant A
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
		if e.other:IsTaskActivityActive(5786,4) and item_lib.check_turn_in(e.trade, {item1 = 34997}) then -- Blessed Impression Book
			e.other:UpdateTaskActivity(5786,4,1);
			e.other:QuestReward(e.self,{itemid = 38443}); -- Item: Blessed Book of Troll Culture
		elseif e.other:IsTaskActivityActive(5789,4) and item_lib.check_turn_in(e.trade, {item1 = 34998}) then -- Revered Impression Book
			e.other:UpdateTaskActivity(5789,4,1);
			e.other:QuestReward(e.self,{itemid = 38444}); -- Item: Revered Book of Troll Culture
		elseif e.other:IsTaskActivityActive(5790,4) and item_lib.check_turn_in(e.trade, {item1 = 34999}) then -- Sacred Impression Book
			e.other:UpdateTaskActivity(5790,4,1);
			e.other:QuestReward(e.self,{itemid = 38445}); -- Item: Sacred Book of Troll Culture
		elseif e.other:IsTaskActivityActive(5791,4) and item_lib.check_turn_in(e.trade, {item1 = 35000}) then -- Eminent Impression Book
			e.other:UpdateTaskActivity(5791,4,1);
			e.other:QuestReward(e.self,{itemid = 38446}); -- Item: Eminent Book of Troll Culture
		-- Not Supported
		elseif e.other:IsTaskActivityActive(5792,4) and item_lib.check_turn_in(e.trade, {item1 = 35017}) then -- Exalted Impression Book
			e.other:UpdateTaskActivity(5792,4,1);
			e.other:QuestReward(e.self,{itemid = 35753}); -- Item: Exalted Book of Troll Culture
		elseif e.other:IsTaskActivityActive(5793,4) and item_lib.check_turn_in(e.trade, {item1 = 35018}) then -- Sublime Impression Book
			e.other:UpdateTaskActivity(5793,4,1);
			e.other:QuestReward(e.self,{itemid = 35754}); -- Item: Sublime Book of Troll Culture
		elseif e.other:IsTaskActivityActive(6955,4) and item_lib.check_turn_in(e.trade, {item1 = 88388}) then -- Venerable Impression Book
			e.other:UpdateTaskActivity(6955,4,1);
			e.other:QuestReward(e.self,{itemid = 49966}); -- Item: Venerable Book of Troll Culture
		elseif e.other:IsTaskActivityActive(7070,4) and item_lib.check_turn_in(e.trade, {item1 = 17835}) then -- Illustrious Impression Book
			e.other:UpdateTaskActivity(7070,4,1);
			e.other:QuestReward(e.self,{itemid = 123418}); -- Item: Illustrious Book of Troll Culture
		elseif e.other:IsTaskActivityActive(7071,4) and item_lib.check_turn_in(e.trade, {item1 = 54449}) then -- Numinous Impression Book
			e.other:UpdateTaskActivity(7071,4,1);
			e.other:QuestReward(e.self,{itemid = 112552}); -- Item: Numinous Book of Troll Culture
		elseif e.other:IsTaskActivityActive(7078,4) and item_lib.check_turn_in(e.trade, {item1 = 55727}) then -- Transcendent Impression Book
			e.other:UpdateTaskActivity(7078,4,1);
			e.other:QuestReward(e.self,{itemid = 134601}); -- Item: Transcendent Book of Troll Culture
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
