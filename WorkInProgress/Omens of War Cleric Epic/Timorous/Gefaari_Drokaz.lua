-- 2.0 Gefaari_Drokaz in Timorous Deep   --Drogerin

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_hp(e)
	if (e.hp_event == 90) then
		eq.depop();
		eq.spawn2(0,0,0,0,0,0); -- Need data on Zordak Ragefire Human Form, Need Loc / Need Heading / Need Database Entry NPCID.
	end
end