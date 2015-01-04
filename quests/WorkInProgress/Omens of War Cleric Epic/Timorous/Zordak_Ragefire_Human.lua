-- Zordak Ragefire 2.0 Fight / Human Form   --Drogerin

function event_spawn(e)
	eq.set_next_hp_event(80);
end


function event_combat(e)
	if(e.joined) then
		e.self:Say("Now you will see the name that will burn Norrath!");
	end
end

function event_hp(e)
	if (e.hp_event == 80) then
		eq.depop();
		eq.spawn2(0,0,0,0,0,0); -- Need Info on Zordak Ragefire Dragon Form // Loc // Heading // NPCID // Database Entry
	end
end