function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
	--eq.world_emote(13,"test");
end
 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if qglobals["ranger_epic"] == "3" and qglobals["ranger_epic_dranik"] == nil and e.other:HasItem(62623) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(336001) then
		eq.set_global("ranger_epic_dranik","1",2,"H2");
		eq.set_timer("ranger_epic_depop",30*60*1000);
		eq.load_encounter('ranger_1_5');
		eq.spawn2(336002, 0, 0, -961.3,2308,-160,252); -- NPC: #Sverins_Fireskin
		eq.spawn2(336001, 0, 0, -919.6,2308,-160,252); -- NPC: #Uisima_Lord_of_the_Depths
		eq.spawn2(336230 ,0, 0, -904,2261,-160,488); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -929,2251,-160,494); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -972,2251,-160,30); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -997,2276,-160,62); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -977,2158,-160,0); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -941,2251,-160,30); -- NPC: #a_fireskin_acolyte
		eq.spawn2(336230 ,0, 0, -865,2179,-160,466); -- NPC: #a_fireskin_acolyte
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
