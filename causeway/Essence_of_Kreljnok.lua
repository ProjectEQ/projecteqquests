function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
	eq.zone_emote(15,"Korbuk's death has released a more powerful spirit into the mortal realm.");
	e.self:Shout("You foolish mortals! How dare you defy the will of Kreljnok! I will be reborn and shall have my sword once more! Hand over what is rightfully mine!");
end


function event_combat(e)
	if e.joined==true then
		eq.set_timer("spawn_adds",150*1000);
		eq.set_timer("check_adds_alive", 2000);
		e.self:Say("The power of the sword has revived me! Prepare to die!");
	else
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
	elseif e.timer=="spawn_adds" then
		e.self:Emote("calls forth to the brood for two new souls to harvest!");
		eq.spawn2(303131, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Kreljnok`s_Power
		eq.spawn2(303130, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()):AddToHateList(e.self:GetHateRandom(),1); -- NPC: Kreljnok`s_Rage
	elseif e.timer=="check_adds_alive" then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(303130) == true or eq.get_entity_list():IsMobSpawnedByNpcTypeID(303131) == true) then
			e.self:ModifyNPCStat("hp_regen", "7000");
		else
			e.self:ModifyNPCStat("hp_regen", "100")
		end
	end
end

function event_death_complete(e)
	eq.zone_emote(15,"The death of Kreljnok signals the end of his power in this region. The once powerful warrior has had his life taken by a far superior force.");
end
