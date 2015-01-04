--vxed/Borer_Trigger.lua NPCID 
--Warrior Epic 1.5
local counter;
function event_spawn(e)
	counter = 0;
	--eq.spawn2( ,0,0,-720,-3200,15.1,128); --Blackfall Boreling
	--eq.spawn2( ,0,0,272.5,-2099,237,57.0);
	--eq.spawn2( ,0,0,-1600,-1700,326.1,152);
end

function event_signal(e)
	if (e.signal == 1) then --Boreling killed
		counter = counter + 1;
		if (counter == 3) then
			--eq.spawn2( ,0,0,-1129,-499,470,198.6); --Blackfall Borer
			eq.zone_emote(0, "The beast is awaiting you up the hill.");
		end
	end
end