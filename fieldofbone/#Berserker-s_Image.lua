--[[
#Berserker-s_Image

Berserker 1.0 rewrite

Drogerin
--]]

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
		if (qglobals['bersolo'] == nil) then
			eq.set_global("bersolo","1",5,"F");
			eq.signal(78100,15,10); --NPC: Mardic_Crimsonsteel
		end
end

function event_spawn(e)
	eq.set_next_hp_event(50);
end


function event_hp(e)
	e.self:Say("You cannot overcome my infinite rage!");
end
