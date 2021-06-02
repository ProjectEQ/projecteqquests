local extra_loot;
local QOS_Inactive = "1,1,6000,100^4,1,20,0,25^7,1^13,1^14,1^15,1^17,1^21,1^31,1^35,1^42,1";
local QOS_Active = "1,1,6000,100^4,1,20,0,25^7,1^13,1^14,1^15,1^17,1^31,1^21,1^42,1";
local instance_id;
local raid_list;
local QOS;

function QOS_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
  
  extra_loot = false;
  eq.set_next_hp_event(20);
  e.self:SetPseudoRoot(true);

  QOS = e.self;
end

function QOS_HP(e)
  if (e.hp_event == 20) then
    -- if the 4 mini's are stillup then disable the QOS till they are dead
    e.self:SetPseudoRoot(false); --becomes unrooted
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(241058)) then
	-- ritana must be kept alive until 20% to receive extra loot
      extra_loot = true;
	eq.zone_emote(13,"Sand cascades from the ceiling as the Quintessence trembles.  The shield protecting Ritana falls as she channels her energy into the Quintessence which tears its feet from the sand, ready to protect its last master.");		
    end

    if (entity_list:IsMobSpawnedByNpcTypeID(241058) or entity_list:IsMobSpawnedByNpcTypeID(241053) or entity_list:IsMobSpawnedByNpcTypeID(241046) or entity_list:IsMobSpawnedByNpcTypeID(241051)) then
      -- disable the QOS till the minis are dead
      e.self:ProcessSpecialAbilities(QOS_Inactive); 
      --e.self:WipeHateList();  
      --e.self:SetOOCRegen(0);  
    end
  end
end

function Mini_Death(e)
  local entity_list = eq.get_entity_list();
  if (entity_list:IsMobSpawnedByNpcTypeID(241058) == false and entity_list:IsMobSpawnedByNpcTypeID(241053) == false and entity_list:IsMobSpawnedByNpcTypeID(241046) == false and entity_list:IsMobSpawnedByNpcTypeID(241051) == false) then
    --QOS = entity_list:GetNPCByNPCTypeID(241052);
    QOS:ProcessSpecialAbilities(QOS_Active); 
  end
eq.spawn2(241078,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
eq.spawn2(241078,0,0,e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
eq.zone_emote(15,"The geomancer's body falls, splitting itself in one last expense of energy.");
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
  eq.zone_emote(15,"Your victory has weakened a shroud of magic cloaking the dungeon's treasure.");
  -- The Earthen Chest
  eq.spawn2(241076, 0, 0, 448, -727, 8.23, 385); -- NPC: #The_Earthen_Chest
  -- The Gem Encrusted Chest
  eq.spawn2(241077, 0, 0, 309, -727, 8.23, 130); -- NPC: #The_Gem_Encrusted_Chest
  
  UpdateLockout();
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
						
							e.self:WipeHateList();
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

function Tree_Death(e)
		local rand = math.random(1,100);
		if (rand <= 50) then
			e.self:CastSpell(4173,e.self:GetID()); --mental renewal
		else
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.spawn2(241081,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		end
end

function Trash_Timer(e)
    if (e.self:CalculateDistance(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ()) >200) then
	eq.zone_emote(13, e.self:GetName() .. " gathers power from the sand at its feet as it moves across the ground "); --mob powers up permanently even after returning to bind
        eq.modify_npc_stat("min_hit", "300")
        eq.modify_npc_stat("max_hit", "1250")
	eq.stop_timer("distcheck");
	end
end

function Trash_Combat(e)
	if (e.joined == true) then  
		eq.set_timer("distcheck", 6000);
	else
		eq.stop_timer("distcheck");
	end
end

function event_encounter_load(e)
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
  eq.register_npc_event('takc', Event.death, 241018, Tree_Death);
  eq.register_npc_event('takc', Event.combat,         241046, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241053, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241058, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241051, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241069, Kamoj_Combat);
  eq.register_npc_event('takc', Event.combat,         241071, Kamoj_Combat);
  eq.register_npc_event('takc', Event.timer,         241046, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241053, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241058, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241051, Mini_Timer);
  eq.register_npc_event('takc', Event.combat,        241079, Split_Combat);
  eq.register_npc_event('takc', Event.combat,        241080, Golem_Combat);
	
  eq.register_npc_event('takc', Event.hp,             241052, QOS_HP);
  eq.register_npc_event('takc', Event.spawn,          241052, QOS_Spawn);
  eq.register_npc_event('takc', Event.signal,         241052, QOS_Signal);
end
