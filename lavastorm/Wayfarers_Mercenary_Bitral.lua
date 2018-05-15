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
	if(e.message:findi("hail")) then
		local NKF=e.other:GetFactionLevel(e.other:GetID(), e.self:GetID(), e.other:GetBaseRace(), e.other:GetClass(), e.other:GetDeity(), 429, e.self);
		if (NKF >= 5) then
			e.self:Say("Hm, you seem the sort that might benefit from an association with Norrath's Keepers.  It can't be all bad being on the side of Firiona Vie. I don't much care myself, they just pay me for my work -- not all of it is noble.");
			-- so we get a random task here if we don't have one. Should we do like even/odd in game minute so everyone in the group can get the same?
			-- Gathering Silk, Population Control
			if (not e.other:IsTaskActive(277) and not e.other:IsTaskActive(278)) then
				eq.task_selector({277, 278});
			else
				e.other:Message(15, "Sorry " .. e.other:GetName() .. ", you already have the maximum number of active tasks."); -- string id 6010, do later, task system should generate it
			end
		else
			e.self:Say("I've gotten acquainted with Norrath's Keepers well enough to know they might be interested in speaking with you.");
			--e.self:Say("You can probably go try to speak to the Dark Reign for work. I've got nothing for you.");
		end
	end
end
