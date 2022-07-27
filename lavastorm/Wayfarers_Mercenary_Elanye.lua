-- Wayfarers_Mercenary_Elanye (27082)
-- Alliance Tasks

--[[
Blood of the Winged 	<= indifferent	Solo
Goblin Broth	<= indifferent	Solo
]]

--only get quest if faction <= indifferent
--1	Ally
--2	Warmly
--3	Kindly
--4	Amiably
--5	Indifferent
--6	Apprehensive
--7	Dubious
--8 Threateningly
--9	Scowls

--404 Dark Reign
--429 Norrath's Keepers

function event_say(e)
    local is_gm = (e.other:Admin() > 80 and e.other:GetGM());
	if (eq.is_current_expansion_lost_dungeons_of_norrath() or is_gm) then

		if(e.message:findi("hail")) then
				e.self:Say("I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their audience.");
				-- Blood of the Winged, Goblin Broth
				eq.task_selector({273, 274});
		end
	end
end
