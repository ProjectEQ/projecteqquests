function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif((e.message:findi("prepared")) and (e.other:GetLevel() >= 46) and (e.other:Class() == "Monk")) then	-- Monk Epic 1.0
		eq.attack(" .. e.other:GetName() .. ");
	end
end

function event_spawn(e)				-- Monk Epic 1.0
	e.self:Say("Im ready when you are. Tell me when you are [prepared].");
end

function event_death_complete(e)	-- Monk Epic 1.0
	e.self:Emote("lets out one last, frustrated breath and gasps.");
	e.self:Say("Trunt! Prepare yourself!");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
