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
		local DRF=e.other:GetFactionLevel(e.other:GetID(), e.self:GetID(), e.other:GetBaseRace(), e.other:GetClass(), e.other:GetDeity(), 1021, e.self);
		if (DRF >= 5) then
			e.self:Say("Feeling a bit like an outsider? I certainly understand that as part of the brotherhood, though I don't envy you. We've been able to make a good bit o' coin off the Dark Reign. Give us a hand and I'll see about helping you get inside.");
			-- Blood Money, Spider's Webs
			eq.task_selector({275, 276});
		else
			e.self:Say("I managed to have a chat with the Dark Reign and they did mention they are looking for recruits. They might listen to you.");
		end
	end
end
