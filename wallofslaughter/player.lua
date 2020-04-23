function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.self:HasItem(12080) and qglobals["cleric20_darkdisciples"] ~= nil) then -- Player has Enchated Signet of Disciples on their character and Zones in.
		e.self:Message(13, "The Enchanted Signet of the Disciples begins to glow.");
	end

	if(e.self:HasItem(69941) and e.self:HasItem(69952) and e.self:HasItem(69942) and e.self:HasItem(69983)) then -- Paladin 1.5 trigger
		if(qglobals["paladin_wos"] ==  nil) then
			eq.spawn2(300087,0,0,-1118.76,1007,13.45,226); -- NPC: #Durunal_the_Cursebearer
			eq.set_global("paladin_wos","1",3,"H2");
		end
	end

	if(qglobals["ranger_epic"] == "8" and qglobals["rng_spawn_wos"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(300057) == false) then
		eq.unique_spawn(300057,0,0,-1491,2015,51.2,192); --#Herrian_Warfrost
		eq.spawn2(300058,0,0,-1495,1965,51.2,160); --an_excited_builder (300058)
		eq.spawn2(300058,0,0,-1447,2014,51.2,220); -- NPC: an_excited_builder
		eq.spawn2(300058,0,0,-1454,1976,51.2,192); -- NPC: an_excited_builder
		--eq.set_global("rng_spawn_wos","1",2,"H2");
	end		
end

function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60312) then -- Stone of Eternal Power: Northeast Eye
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "10" and qglobals["warr_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warr_epic_wos","1",5,"F");
		end
	elseif(e.self:Class() == "Wizard" and e.item:GetID() == 11445) then  --Fluxing Rod
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_epic"] == "1" and qglobals["wiz_wos_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("wiz_wos_chest","1",5,"F");
		end
	elseif(e.self:Class() == "Paladin" and e.item:GetID() == 69971) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["paladin_epic"] == "6" and qglobals["paladin_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("paladin_epic_wos","1",5,"F");
		end
		e.self:Message(6,"As you hold the sword, your soul is tugged for a few seconds and then all four soulstones speak in unison, 'This sword is the key, this sword is the misery, this sword is the instrument that took us away, and this sword is what will set us free. Take this cursed sword to Irak Altil, for he will know how to end our pain.");	
	elseif(e.self:Class() == "Cleric" and e.item:GetID() == 12433) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["cleric20_robedropped"] ~= nil) then
			e.self:DelGlobal("cleric20_robedropped");
			e.self:DelGlobal("cleric20_darkdisciples"); -- I couldn't retrigger the event
		else
			return 1; -- loot fail
		end
	elseif(e.self:Class() == "Shaman" and e.item:GetID() == 57404) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shaman_epic"] == "12") then
			if(qglobals["shaman_epic_wos"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("shaman_epic_wos","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Druid" and e.item:GetID() == 62872) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "10") then
			if(qglobals["druid_epic_wos"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("druid_epic_wos","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Ranger" and e.item:GetID() == 76999) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ranger_epic"] == "8") then
			if(qglobals["rng_wos_chest"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("rng_wos_chest","1",5,"F");
			end
		else
			return 1;
		end			
	elseif(e.self:Class() == "Enchanter" and e.item:GetID() == 57919) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ench_epic"] == "9") then
			if(qglobals["ench_wos_chest"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("ench_wos_chest","1",5,"F");
			end
		else
			return 1;
		end			
	end	
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local instance_id = nil;

  local lockouts = {
      { "Anguish_keldovan", "Anguish: Keldovan the Harrier" },
      { "Anguish_jelvan", "Anguish: Rescing Jelvan" },
	  { "Anguish_ture", "Anguish: Ture" },	  
      { "Anguish_hanvar", "Anguish: Warden Hanvar" },
      { "Anguish_amv", "Anguish: Arch Magus Vangi" },
      { "Anguish_omm", "Anguish: Overlord Mata Muram" },
      { "Anguish_lower_orb", "Anguish: Lower Globe of Discordant Energy" },
      { "Anguish_upper_orb", "Anguish: Upper Globe of Discordant Energy" },
      { "Anguish_augs", "Anguish: Replay Timer" }
  };
  eq.debug("Door: " .. door_id .. " clicked");

  if (door_id == 3) then
    instance_id = eq.get_instance_id('anguish', 0);
    
    if (instance_id ~= nil and instance_id ~= 0) then
      e.self:MovePCInstance(317, instance_id, -9, -2466, -79, 510); -- Zone: anguish

    -- if GM just give him an instance
    elseif (e.self:Admin() >= 80 and e.self:GetGM()) then
      instance_id = eq.create_instance('anguish', 0, 21600);
      eq.assign_raid_to_instance(instance_id);
      e.self:Message(14, "GM Exception: Anguish is open to you");
      eq.set_global(instance_id.."_anguish_bit",tostring(0),7,"H6");
    else 
      local instance_requests = require("instance_requests");

      -- If a Player has Anguish_augs then they can not start an instance of anguish.
      local augs_check = instance_requests.CheckPlayersForLockout('raid', 'Anguish_augs', 'Anguish: Replay Timer', e.self);
      if (augs_check ) then
        e.self:Message(13, "The way to Anguish is blocked to your raid at this time");
      else
        -- Every member of the raid needs to have 2 quest_globals set: oow_rss_taromani_insignias and oow_mpg_raids_complete
        local required_globals = {
          {'oow_rss_taromani_insignias', "is not protected from the chaos magic in Mata Muram's citadel." },
          {'oow_mpg_raids_complete', 'must complete the Muramite Proving Grounds raid trials'}
        };
        local request = instance_requests.ValidateRequest('raid', 'anguish', 0, 6, 54, 65, nil, required_globals, e.self, lockouts);
        -- TODO: Need to review why i placed the flags check; shouldn't be needed but I added it for some 
        -- reason.
        -- if (request.valid and request.flags == 1) then
        --   instance_requests.DisplayLockouts(e.self, e.self, lockouts);
        -- elseif (request.valid and request.flags == 0) then
        if (request.valid) then
          instance_id = eq.create_instance('anguish', 0, 21600);
          if (instance_id == 0) then
            e.self:Message(13, "Instance failed to be created, yell at a GM");
          else
            eq.assign_raid_to_instance(instance_id);

            -- Set the lockout for the instance with the bits that represent the mobs that 
            -- will be spawned by the zone_status upon entry
            eq.set_global(instance_id.."_anguish_bit",tostring(request.flags),7,"H6");

            eq.cross_zone_message_player_by_name(5, "GMFizban", "Anguish -- Instance: " .. instance_id);
            e.self:Message(14, "The door swings wide and allows you entrance to Anguish, the Fallen Palace.");
          end
        end
      end
    end
  end
end
