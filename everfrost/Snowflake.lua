function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grrrrrr!!"); 
	elseif(e.message:findi("megan")) then
		if(e.other:GetFaction(e.self) < 5 and e.self:GetX() == -1161 and e.self:GetY() == 2022) then
			e.self:Say("Ruff... ruff... woof!");
			eq.start(195);
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Emote("apparently responds only to one who follows the Wolves of the North.");
		else
			e.self:Emote("growls at you. It can sense you are an enemy of the Wolves of the North.");
		end
	end
end

