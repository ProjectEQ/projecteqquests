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
			e.self:Say("So, you want to get in good with them dark crusaders, eh? I might be able to help you. If you run a few errands for me, I can probably put in a good word.");
			eq.task_selector({279, 280});
		else
			e.self:Say("You can probably go try to speak to the Dark Reign for work.  I've got nothing for you.");
		end
	end
end
