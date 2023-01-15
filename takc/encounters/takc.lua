local extra_loot;
local instance_id;
local raid_list;

function QOS_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
  
  extra_loot = false;
  eq.set_next_hp_event(20);
  e.self:SetPseudoRoot(true);
end

function QOS_HP(e)
  if (e.hp_event == 20) then
    -- if the 4 mini's are stillup then no damage can be done to QOS till they are dead
    e.self:SetPseudoRoot(false); --becomes unrooted
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(241058)) then
	-- ritana must be kept alive until 20% to receive extra loot
      extra_loot = true;
      eq.signal(241058,1); --Ritana: -- Heal Rit to full and add spell and remove immunities
      eq.zone_emote(13,"Sand cascades from the ceiling as the Quintessence trembles.  The shield protecting Ritana falls as she channels her energy into the Quintessence which tears its feet from the sand, ready to protect its last master.");		
    end

    if (entity_list:IsMobSpawnedByNpcTypeID(241058) or entity_list:IsMobSpawnedByNpcTypeID(241053) or entity_list:IsMobSpawnedByNpcTypeID(241046) or entity_list:IsMobSpawnedByNpcTypeID(241051)) then
      -- disable damage to the QOS till the minis are dead
      e.self:SetSpecialAbility(35, 1); -- Immune to Damage
	e.self:ModifyNPCStat("hp_regen", "1"); -- remove combat regen
    end
  end
end

function Qos_Signal(e)
	if(e.signal == 1) then
		e.self:ModifyNPCStat("hp_regen", "10000"); --add combat regen
		e.self:SetSpecialAbility(35,0); -- remove Immune to Damage
	elseif(e.signal == 2) then
		e.self:SetSpecialAbilityParam(SpecialAbility.summon, 1, 100); --summons at 100% health
	end
end


function Mini_Death(e)
  local entity_list = eq.get_entity_list();
  if (entity_list:IsMobSpawnedByNpcTypeID(241058) == false and entity_list:IsMobSpawnedByNpcTypeID(241053) == false and entity_list:IsMobSpawnedByNpcTypeID(241046) == false and entity_list:IsMobSpawnedByNpcTypeID(241051) == false) then
	 --signal qos remove immunity
    eq.signal(241052,1);
	
  end
	
  eq.spawn2(241078,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
  eq.spawn2(241078,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
  eq.zone_emote(15,"The geomancer's body falls, splitting itself in one last expense of energy.");
	
  if (entity_list:IsMobSpawnedByNpcTypeID(241058) == true and entity_list:IsMobSpawnedByNpcTypeID(241053) == false and entity_list:IsMobSpawnedByNpcTypeID(241046) == false and entity_list:IsMobSpawnedByNpcTypeID(241051) == false) then
	--signal qos start summoning at 100% health when the 3 other nameds are dead and ritana is alive
	eq.signal(241052,2); 

  end
end

function UpdateLockout()
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("4d12h"))
  end
end

function QOS_Death(e)

  if (extra_loot) then
    -- Ritanas_Ornate_Chest
    eq.spawn2(241075, 0, 0, 379, -797, 8.23, 1); -- NPC: #Ritanas_Ornate_Chest
  end
  --
  eq.zone_emote(15,"Your victory has shattered the shroud of magic cloaking the dungeon's treasure.");
  -- The Earthen Chest
  eq.spawn2(241076, 0, 0, 448, -727, 8.23, 385); -- NPC: #The_Earthen_Chest
  -- The Gem Encrusted Chest
  eq.spawn2(241077, 0, 0, 309, -727, 8.23, 130); -- NPC: #The_Gem_Encrusted_Chest
  
  UpdateLockout();
end

function Qos_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
	end
end

function Mini_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 241046 or npc:GetNPCTypeID() == 241053 or npc:GetNPCTypeID() == 241058 or npc:GetNPCTypeID() == 241051)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
	else
		eq.stop_timer("OOBcheck");
	end
end


function Mini_Timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetY() > -560) then
		e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
		e.self:GotoBind();
		e.self:WipeHateList();
	else
		eq.set_timer("OOBcheck", 6 * 1000);
	end
end
end

function Kamoj_Combat(e)
	if (e.joined == true) then
		instance_id = eq.get_zone_instance_id();
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and (npc:GetNPCTypeID() == 241052)) then
				local top_hate = e.self:GetHateTop()
					if (top_hate.valid and top_hate:IsClient()) then
					local top_client = top_hate:CastToClient()
						if (top_client.valid) then

							e.self:SetHate(top_client, 1, 1)
							top_client:MovePCInstance(241, instance_id, 380, -726, 27, 1);
						
						end
					end
			end	
		end
	end
end

function Split_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"A strange current of energy passes through you, cold and fast-moving. From the south comes the sound of two clear voices, blending together in a soothing melody. Ahead to the west, the sound of stamping feet and heavy chanting originates, echoing through the passageways. A strange sense of urgency tugs you towards the west.");
		eq.depop_with_timer();
	end
end

function Golem_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"The chanting and stamping sounds grow louder, closer, with a more feverish pitch. Along with them comes the deafening crash of stone against stone as something very large moves before you. The energy is flying all around you, a vortex of sand and light.");
		eq.depop_with_timer();
	end
end

function Priest_Combat(e)
	if (e.joined == true) then
		eq.zone_emote(15,"The ethereal voices wind together, climbing over each other in a beautiful duet. The sound is filled with pure beauty, and the owners of these voices semm enraptured and unaware of your existence.");
		eq.depop_with_timer();
	end
end

function Tree_Death(e)
		local rand = math.random(1,4); -- rand 4 does nothing
		if (rand == 1) then
			e.self:CastSpell(4173,e.self:GetID()); --mental renewal
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"As the great relic of nature splinters, its fading life force dusts you with a natural magic.");
		elseif (rand == 2) then
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"Angry saplings break through the splintered tree and rush toward you!");
		elseif (rand == 3) then
			e.self:CastSpell(4174,e.self:GetID()); --physical renewal
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 100,"As the great relic of nature splinters, its fading life force dusts you with a natural magic.");
		end
end

function Trash_Timer(e)
    if (e.self:CalculateDistance(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ()) >200) then
	eq.zone_emote(13, e.self:GetCleanName() .. " gathers power from the sand at its feet as it moves across the ground "); --mob powers up permanently even after returning to bind
        eq.modify_npc_stat("min_hit", "361");
        eq.modify_npc_stat("max_hit", "1235");
		
	e.self:ModifyNPCStat("attack_delay","15");
		
	e.self:SetSpecialAbility(12, 1);
		
	eq.stop_timer("distcheck");
    elseif (e.timer == "check") then
		eq.stop_timer("check");
		local level = e.self:GetLevel();
			if(level <= 64) then
			e.self:SetSpecialAbility(14, 0);
			end
	end
end

function Trash_Combat(e)
	if (e.joined == true) then  
		eq.set_timer("distcheck", 6000);
	else
		eq.stop_timer("distcheck");
	end
end

function Trap1_Combat(e)
	if (e.joined == true) then
		e.self:CastSpell(4163,e.other:GetID(),0,0); -- Spell:Curse of the Desert should fire 5 times consecutively on every person in range
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 70,"Stinging sand assaults you from every direction.");
		eq.depop_with_timer();
	end
end

function Charmable_Trash_Spawn(e)
	eq.set_timer("check", 10 * 1000);
end

function Ritana_Signal(e)
	e.self:SetHP(e.self:GetMaxHP());
	e.self:SetSpecialAbility(20, 0); -- remove Immune to spells
	e.self:SetSpecialAbility(22, 0); -- remove Immune to non-Bane Melee
	e.self:AddAISpell(0, 4288, 1, -1, -1, -200); --add spell Curse of Takish-Hiz
end

function event_encounter_load(e)
  eq.register_npc_event('takc', Event.signal,          241058, Ritana_Signal);
  eq.register_npc_event('takc', Event.spawn, 241013, Charmable_Trash_Spawn);
  eq.register_npc_event('takc', Event.timer, 241001, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241001, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241003, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241003, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241036, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241036, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241013, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241013, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241035, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241035, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241015, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241015, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241007, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241007, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241008, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241008, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241012, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241012, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241004, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241004, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241000, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241000, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241006, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241006, Trash_Combat);
  eq.register_npc_event('takc', Event.timer, 241019, Trash_Timer);
  eq.register_npc_event('takc', Event.combat, 241019, Trash_Combat);
  eq.register_npc_event('takc', Event.death_complete, 241058, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241053, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241046, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241051, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241052, QOS_Death);
  eq.register_npc_event('takc', Event.combat, 241052, Qos_Combat);
  eq.register_npc_event('takc', Event.signal, 241052, Qos_Signal);
  eq.register_npc_event('takc', Event.death, 241018, Tree_Death);
  eq.register_npc_event('takc', Event.combat,         241046, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241053, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241058, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241051, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241069, Kamoj_Combat);
  eq.register_npc_event('takc', Event.combat,         241071, Kamoj_Combat);
  eq.register_npc_event('takc', Event.timer,         241046, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241052, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241053, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241058, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241051, Mini_Timer);
  eq.register_npc_event('takc', Event.combat,        241079, Split_Combat);
  eq.register_npc_event('takc', Event.combat,        241080, Golem_Combat);
  eq.register_npc_event('takc', Event.combat,        241084, Priest_Combat);
  eq.register_npc_event('takc', Event.combat,        241082, Trap1_Combat);
	
  eq.register_npc_event('takc', Event.hp,             241052, QOS_HP);
  eq.register_npc_event('takc', Event.spawn,          241052, QOS_Spawn);
  eq.register_npc_event('takc', Event.signal,         241052, QOS_Signal);
end
