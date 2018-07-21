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
			-- Gathering Silk, Population Control
			eq.task_selector({277, 278});
		else
			e.self:Say("I understand your desire to win the hearts of Norrath's Keepers.  I'm sure they'd be happy to talk with you.");
		end
	end
end
