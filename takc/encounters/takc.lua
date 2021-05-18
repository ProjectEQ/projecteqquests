local extra_loot;
local QOS_Inactive = "18,1^19,1^20,1^21,1^24,1^25,1";
local QOS_Active = "1,1,6000,100^4,1,20,0,25^7,1^13,1^14,1^15,1^17,1^31,1^21,1^42,1";
local instance_id;
local raid_list;
local QOS;

function QOS_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
  
  extra_loot = false;
  eq.set_next_hp_event(20);

  QOS = e.self;
end

function QOS_HP(e)
  if (e.hp_event == 20) then
    -- if the 4 mini's are stillup then disable the QOS till they are dead
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(241058)) then
	-- ritana must be kept alive until 20% to receive extra loot
      extra_loot = true;
    end

    if (entity_list:IsMobSpawnedByNpcTypeID(241058) or entity_list:IsMobSpawnedByNpcTypeID(241053) or entity_list:IsMobSpawnedByNpcTypeID(241046) or entity_list:IsMobSpawnedByNpcTypeID(241051)) then
      -- disable the QOS till the minis are dead
      e.self:ProcessSpecialAbilities(QOS_Inactive); 
      e.self:WipeHateList();  
      e.self:SetOOCRegen(0);  
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
							--e.self:WipeHateList();
						end
					end
			end	
		end
	end
end

function event_encounter_load(e)
  eq.register_npc_event('takc', Event.death_complete, 241058, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241053, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241046, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241051, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241052, QOS_Death);
  eq.register_npc_event('takc', Event.combat,         241046, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241053, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241058, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241051, Mini_Combat);
  eq.register_npc_event('takc', Event.combat,         241069, Kamoj_Combat);
  eq.register_npc_event('takc', Event.timer,         241046, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241053, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241058, Mini_Timer);
  eq.register_npc_event('takc', Event.timer,         241051, Mini_Timer);

  eq.register_npc_event('takc', Event.hp,             241052, QOS_HP);
  eq.register_npc_event('takc', Event.spawn,          241052, QOS_Spawn);
  eq.register_npc_event('takc', Event.signal,         241052, QOS_Signal);
end
