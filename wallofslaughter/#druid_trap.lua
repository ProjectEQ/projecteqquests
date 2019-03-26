function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 100, e.self:GetX() + 100, e.self:GetY() - 100, e.self:GetY() + 100);
end

function event_enter(e)
	if(e.other:Class() == "Druid") then
		local qglobals = eq.get_qglobals(e.self,e.other);
		if(qglobals["druid_epic"] == "10" and qglobals["druid_wos"]==nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(300096) == false ) then	
			eq.spawn2(300096, 0, 0, 414.8,311,128.6,256); -- NPC: #Retired_Soldier
			eq.spawn2(300097, 0, 0, 396.7,198,129,256); -- NPC: #a_nervous_guardian
			eq.spawn2(300097, 0, 0, 436.6,198,129,256); -- NPC: #a_nervous_guardian
			eq.set_timer("depop",30*60*1000);
			eq.set_global("druid_wos","1",3,"M20");
		end
	end
end

function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop");
		eq.depop_all(300096);
		eq.depop_all(300097);
		eq.depop_all(300098);
		eq.depop_all(300099);
	end
end
