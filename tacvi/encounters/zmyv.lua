
function ZMYV_Spawn(e)
  eq.get_entity_list():FindDoor(21):SetLockPick(0);
  eq.set_next_hp_event(90);
e.self:ModSkillDmgTaken(1, 5); -- 1h slashing
e.self:ModSkillDmgTaken(3, 5); -- 2h slashing
end

function ZMYV_Combat(e)
  if (e.joined == true) then
    e.self:Say("The weak willed and the idle will serve my cause.");
    --eq.set_timer("allure", 90 * 1000);
  else
    eq.set_timer("wipecheck", 1 * 1000);
    eq.stop_timer("check");
	--eq.stop_timer("allure");
  end
end

function ZMYV_Timer(e)
  if (e.timer == "wipecheck") then
    local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
    if (client:IsClient() == false) then
      -- Wipe Mechanics
      eq.get_entity_list():FindDoor(21):SetLockPick(0);
      eq.spawn2(298023, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Zun`Muram_Yihst_Vor
      eq.depop();
    end
    
elseif e.timer == "allure" then 
		local total_cast = 0;
		while total_cast <= 6 do -- cast on 6 players - No pets
			if blah then
				local target = e.self:GetHateRandom();
				if target:IsClient() then
					total_cast = total_cast + 1;
					e.self:CastedSpellFinished(4441, target); -- Spell: Allure of Hatred
				end
			end
		end
		e.self:WipeHateList();
	elseif (e.timer == "check") then
		local instance_id = eq.get_zone_instance_id();
		e.self:ForeachHateList(
		  function(ent, hate, damage, frenzy)
			if(ent:IsClient() and ent:GetX() < 295 or ent:GetX() > 447 or ent:GetY() < -560 or ent:GetY() > -418) then
			  local currclient=ent:CastToClient();
				--e.self:Shout("You will not evade me " .. currclient:GetName())
				currclient:MovePCInstance(298,instance_id, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); -- Zone: tacvi
				currclient:Message(5,"Zun`Muram Yihst Vor says, 'You dare enter my chambers and then try to leave? Your punishment will be quite severe.");
			end
		  end
		);
	end
end

function ZMYV_Hp(e)
  if (e.hp_event == 90) then
    eq.get_entity_list():FindDoor(21):SetLockPick(-1);
    eq.set_timer("check", 1 * 1000); -- set scorpion timer
    eq.set_next_hp_event(75);
    eq.zone_emote(15,"Zun`Muram Yihst Vor says, 'Is this is the best you can do? Come now, show me your true strength and I will show you mine.");
    e.self:ModifyNPCStat("min_hit", tostring(1899));
    e.self:ModifyNPCStat("max_hit", tostring(5176));
  elseif (e.hp_event == 75) then
    eq.set_next_hp_event(50);
    eq.zone_emote(15,"Zun`Muram Yihst Vor says, 'To think I was actually worried you might be worthy foes.");
    e.self:ModifyNPCStat("min_hit", tostring(2124));
    e.self:ModifyNPCStat("max_hit", tostring(5401));
  elseif (e.hp_event == 50) then
    eq.set_next_hp_event(20);
    eq.zone_emote(15,"Zun`Muram Yihst Vor says, 'Ahh, sweet pain. It is such an intoxicating feeling. I thank you for the pleasure. Now let me return the favor.");
    e.self:ModifyNPCStat("min_hit", tostring(2254));
    e.self:ModifyNPCStat("max_hit", tostring(5591));
  elseif (e.hp_event == 20) then
    eq.zone_emote(15,"Zun`Muram Yihst Vor's body bulges with strength as he enters a blind rage.");
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 50); -- 50% Mitigation
		e.self:SetSpecialAbility(SpecialAbility.rampage, 0);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
    e.self:ModifyNPCStat("min_hit", tostring(2573));
    e.self:ModifyNPCStat("max_hit", tostring(5850));
  end
end

function ZMYV_Death(e)
  eq.signal(298223,298023); -- NPC: zone_status
  eq.get_entity_list():FindDoor(21):SetLockPick(0);
end

function event_encounter_load(e)
  eq.register_npc_event('zmyv', Event.spawn,          298023, ZMYV_Spawn); 
  eq.register_npc_event('zmyv', Event.combat,         298023, ZMYV_Combat); 
  eq.register_npc_event('zmyv', Event.timer,          298023, ZMYV_Timer); 
  eq.register_npc_event('zmyv', Event.hp,             298023, ZMYV_Hp); 
  eq.register_npc_event('zmyv', Event.death_complete, 298023, ZMYV_Death); 
end

function event_encounter_unload(e)
end
