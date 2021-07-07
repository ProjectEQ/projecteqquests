-- Wayfarers_Mercenary_Elanye (27082)
-- Alliance Tasks

--[[
Blood of the Winged 	<= indifferent	Solo
Goblin Broth	<= indifferent	Solo
]]

function event_say(e)
	if(e.message:findi("hail")) then
			e.self:Say("I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their audience.");
			-- Blood of the Winged, Goblin Broth
			eq.task_selector({273, 274});
	end
end
