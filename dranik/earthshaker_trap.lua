--spawn trap at -1534,129,9.87
function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
	--eq.world_emote(13,"test");
end

function event_enter(e)
	--e.other:Message(15,"The gr");
	if(e.other:Class() == "Druid") then
		local qglobals = eq.get_qglobals(e.other);
		if (qglobals["druid_epic"] == "7" and qglobals["druid_epic_dranik"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(336214) == false ) then
			e.other:Message(15,"The ground shakes violently and a deep thudding sound rolls across the land");
			eq.set_global("druid_epic_dranik","1",2,"H2");
			eq.set_timer("druid_epic_depop",30*60*1000);
			eq.spawn2(336214, 0, 0, -1591,536,-40,101);
		end
	end
end

function event_timer(e)
	if (e.timer=="ranger_epic_depop") then
		eq.stop_timer("ranger_epic_depop");
		eq.depop_all(336214); 
	end
end