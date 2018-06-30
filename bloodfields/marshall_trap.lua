function event_spawn(e)
--	e.self:SetInvisible(2);
--	e.self:SetTargetable(false);
	eq.set_proximity(e.self:GetX() - 100, e.self:GetX() + 100, e.self:GetY() - 100, e.self:GetY() + 100);
--	eq.world_emote(13,"test");
end
 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(qglobals["ranger_epic"] == "2" and qglobals["ranger_epic_bloodfield"] == nil and e.other:HasItem(62844) == true and eq.get_entity_list():IsMobSpawnedByNpcTypeID(301065) == false ) then
		e.other:Message(15,"You feel the Red Dogwood Seed thrash violently for a moment as you near the earth spirit.");
		eq.set_global("ranger_epic_bloodfield","1",2,"H2");
		eq.set_timer("ranger_epic_depop",30*60*1000);
		eq.load_encounter('ranger_1_5');
		eq.spawn2(301065, 0, 0, 774,437,-924.8,394);
		eq.spawn2(301066, 0, 0, 740,436,-924.8,394);
		eq.spawn2(301067 ,0, 0, 729,457,-924.8,190);
		eq.spawn2(301068 ,0, 0, 762.7,457,-925.7,382);
		eq.spawn2(301068 ,0, 0, 762.7,435,-924.8,260);		
	end
end

function event_timer(e)
	if (e.timer=="ranger_epic_depop") then
		eq.stop_timer("ranger_epic_depop");
		eq.depop_all(301065); 
		eq.depop_all(301066);
		eq.depop_all(301067);
		eq.depop_all(301068);
	end
end
