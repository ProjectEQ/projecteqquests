-- Newer Cultural Tradeskill Armor Quest

local pickclaw_list = {11007,11010,11020,11043,11049,11052,11056,11063,11069,11078,11085,11096,11113,11131};

function event_killed_merit(e)
	if e.other:IsTaskActive(5784) then
		local npc_id	= e.self:GetNPCTypeID();
		local quest_npc	= false;
		for i = 1, #pickclaw_list do
			if npc_id == pickclaw_list[i] then
				quest_npc = true;
			end
		end


		if quest_npc then
			if math.random(100) <= 30 then
				if e.other:HasItem(34997) then
					e.other:UpdateTaskActivity(5784,1,1);
				else
					e.other:Message(MT.Yellow, "You see the perfect pattern, but as you search your bags you cannot find your impression book.");
				end
			end
		end
	end
end
