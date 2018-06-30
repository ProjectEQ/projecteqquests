function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
end
 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(qglobals["ranger_epic"] == "2" and qglobals["ranger_epic_natimbi"] == nil and e.other:HasItem(62844) == true and eq.get_entity_list():IsMobSpawnedByNpcTypeID(280084) == false ) then
		e.other:Message(15,"You feel the Red Dogwood Seed thrash violently for a moment as you near the water spirit.");
		eq.set_global("ranger_epic_natimbi","1",2,"H2");
		eq.set_timer("ranger_epic_depop",30*60*1000);
		eq.load_encounter('ranger_1_5');
		eq.spawn2(280084, 0, 0, 1600,-490,439,431.2);
		eq.spawn2(280085, 0, 0, 1515,-455,420.2,468);
		eq.spawn2(280086 ,0, 0, 1482,-478,420.7,494);
	end
end

function event_timer(e)
	if (e.timer=="ranger_epic_depop") then
		eq.stop_timer("ranger_epic_depop");
		eq.depop_all(280085); 
		eq.depop_all(280086);
		eq.depop_all(280087);
		eq.depop_all(280088);
		eq.depop_all(280089);
		eq.depop_all(280084);
	end
end
