function event_spawn(e)
	eq.set_timer('delay', 1000);
end

function event_timer(e)
	eq.stop_timer('delay');
	eq.set_proximity(e.self:GetX()-30, e.self:GetX()+30, e.self:GetY()-30, e.self:GetY()+30, -999999, 999999, true);
	eq.enable_proximity_say();
end

function event_proximity_say(e) 
	if (e.message:findi("Sanait Sanaiij Tsulum") and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336242) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336243) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336244)) then
		local qglobals = eq.get_qglobals(e.other)
		if (qglobals["necro_epic"] == "5") then
			e.self:Emote("implodes, blinding you with a bright flash of light, Three horrendous creatures now appear before you, and they don't look happy... ");
			eq.spawn2(336244, 0, 0, 152,2362.5,118.5,200); --rag
			eq.spawn2(336243, 0, 0, 158,2381.5,118.5,200); --gor
			eq.spawn2(336242, 0, 0, 132,2362.5,118.5,200); --arl
			eq.depop_with_timer();
		end
	end
end
