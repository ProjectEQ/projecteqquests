local task_array = {};

function event_say(e)
	-- Setup Task Array
	table_setup(e);

	if e.message:findi("hail") then
		e.other:Message(MT.NPCQuestSay, "Greetings and welcome. I have been compiling reports from all over Norrath! There are many odd jobs to be done by someone like you. Would you be interested in such a [quest]?");
	elseif e.message:findi("quest") then
		eq.task_selector(task_array);
	end
end

function table_setup(e)
	task_array = {}; -- Clear Table

	table.insert(task_array, 5738);	-- Task: Haunted Butcherblock
	table.insert(task_array, 5739);	-- Task: Scouting Blackburrow
	table.insert(task_array, 5740);	-- Task: Desert Crawl
	table.insert(task_array, 5742);	-- Task: Within the Warrens
	table.insert(task_array, 5744);	-- Task: The Frozen Crystal

	if eq.is_current_expansion_depths_of_darkhollow() then
		table.insert(task_array, 5741); -- Task: Elusive Wisps
	else
		table.insert(task_array, 505741); -- Task: Elusive Wisps (Old Nektulos)
	end

	if eq.is_current_expansion_the_serpents_spine() then
		table.insert(task_array, 5743); -- Task: Protecting the High Pass
	else
		table.insert(task_array, 505743); -- Task: Protecting the High Pass (Old Highpass)
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
