function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
end


function event_combat(e)
	if e.joined==true then
		eq.set_timer("drain", math.random(5,10) * 1000);
		eq.set_timer("spawn_adds",150*1000);
		eq.set_timer("check_adds_alive", 2000);		
	else
		eq.stop_timer("drain");
		eq.stop_timer("spawn_adds");
		eq.stop_timer("check_adds_alive");
	end
end
  
function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop")
		eq.depop_all(303131);
		eq.depop_all(303130);
		eq.depop();
	elseif e.timer=="drain" then
		e.self:CastSpell(6118, e.self:GetTarget():GetID());	
		eq.set_timer("drain", 25 * 1000);
	elseif e.timer=="spawn_adds" then
		eq.spawn2(303131, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1);
		eq.spawn2(303130, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1);	
	elseif e.timer=="check_adds_alive" then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(303130) == true or eq.get_entity_list():IsMobSpawnedByNpcTypeID(303131) == true) then
			e.self:ModifyNPCStat("hp_regen", "7000");
		else
			e.self:ModifyNPCStat("hp_regen", "100")
		end
	end
end