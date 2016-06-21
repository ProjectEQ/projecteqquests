function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
	--eq.world_emote(13,"test");
end
 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(qglobals["ranger_epic"] == "3" and qglobals["ranger_epic_dranik"] == nil and e.other:HasItem(62623) == true and eq.get_entity_list():IsMobSpawnedByNpcTypeID(336001) == false ) then
		eq.set_global("ranger_epic_dranik","1",2,"H2");
		eq.set_timer("ranger_epic_depop",30*60*1000);
		eq.load_encounter('ranger_1_5');
		eq.spawn2(336002, 0, 0, -961.3,2308,-160,126);
		eq.spawn2(336001, 0, 0, -919.6,2308,-160,126);
		eq.spawn2(336230 ,0, 0, -904,2261,-160,244);
		eq.spawn2(336230 ,0, 0, -929,2251,-160,247);
		eq.spawn2(336230 ,0, 0, -972,2251,-160,15);
		eq.spawn2(336230 ,0, 0, -997,2276,-160,31);	
		eq.spawn2(336230 ,0, 0, -977,2158,-160,0);
		eq.spawn2(336230 ,0, 0, -941,2251,-160,15);
		eq.spawn2(336230 ,0, 0, -865,2179,-160,233);
	end
end

function event_timer(e)
	if (e.timer=="ranger_epic_depop") then
		eq.stop_timer("ranger_epic_depop");
		eq.depop_all(336002); 
		eq.depop_all(336001);
		eq.depop_all(336230);
		eq.depop_all(336000);
	end
end