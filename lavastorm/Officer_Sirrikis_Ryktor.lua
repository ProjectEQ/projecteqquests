-- Officer_Sirrikis_Ryktor (27096)
-- Dark Reign Tasks

--[[
Army of Stone	>= amiable	292	Solo
Blood from Sand	>= amiable	293	Solo
Blood of the Basilisk	>= indifferent	291	Solo
Clearing the Path	>= indifferent	295	Solo
Knowledge is Power	>= amiable	299	Solo
Muddy the Waters	>= amiable	300	Solo
Reap the Kirin Mind	>= amiable	302	Solo
Snowfoot Attack	>= amiable	304	Solo
The Burning Poison	>= indifferent	306	Solo
]]

--only get quest if faction >= indifferent
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
			local DRF=e.other:GetFactionLevel(e.other:GetID(), e.self:GetID(), e.other:GetBaseRace(), e.other:GetClass(), e.other:GetDeity(), 1021, e.self);
			if (DRF <= 5) then
				e.self:Say("Perhaps you will find a path to the higher ranks of the Dark Reign -- a place I'm sure I shall find myself someday... someday.");
				if (DRF <=4) then
					eq.task_selector({292, 293, 307, 295, 299, 300, 302 ,304 ,306});           
				else
					eq.task_selector({307, 295, 306});
				end         
			else
				e.self:Say("You can probably go try to speak to the Dark Reign for work.  I've got nothing for you.");
			end
		end
	end
end
