function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.self:HasItem(12080) and qglobals["cleric20_darkdisciples"] ~= nil) then -- Player has Enchated Signet of Disciples on their character and Zones in.
		e.self:Message(MT.Red, "The Enchanted Signet of the Disciples begins to glow.");
	end

	if(e.self:HasItem(69941) and e.self:HasItem(69952) and e.self:HasItem(69942) and e.self:HasItem(69983)) then -- Paladin 1.5 trigger
		if(qglobals["paladin_wos"] ==  nil) then
			eq.spawn2(300087,0,0,-1118.76,1007,13.45,226); -- NPC: #Durunal_the_Cursebearer
			eq.set_global("paladin_wos","1",3,"H2");
		end
	end

	if(qglobals["ranger_epic"] == "8" and qglobals["rng_spawn_wos"] == nil and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(300057)) then
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
		if(qglobals["warrior_epic"] == "10") then
			if (qglobals["warr_epic_wos"] == nil ) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("warr_epic_wos","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Wizard" and e.item:GetID() == 11445) then  --Fluxing Rod
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_epic"] == "1") then
			if (qglobals["wiz_wos_chest"] == nil) then
				eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("wiz_wos_chest","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Paladin" and e.item:GetID() == 69971) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["paladin_epic"] == "6" and qglobals["paladin_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("paladin_epic_wos","1",5,"F");
		end
		e.self:Message(MT.Gray,"As you hold the sword, your soul is tugged for a few seconds and then all four soulstones speak in unison, 'This sword is the key, this sword is the misery, this sword is the instrument that took us away, and this sword is what will set us free. Take this cursed sword to Irak Altil, for he will know how to end our pain.");	
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

local expedition_info = {
	expedition = { name="Anguish, the Fallen Palace", min_players=6, max_players=54 },
	instance   = { zone="anguish", version=0, duration=eq.seconds("6h") },
	compass    = { zone="wallofslaughter", x=1353.15, y=1712.19, z=109.001 },
	safereturn = { zone="wallofslaughter", x=1349.13, y=1715.00, z=123.81, h=0.0 },
	zonein     = { x=-9, y=-2466, z=-79, h=0 }
}

local anguish_door_cooldown_expire_time = 0

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	-- e.self:Message(MT.Green, "Door ID is: [" .. door_id .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "]");   --debug to easily check door IDs

	if door_id == 3 then
		-- zone entry is gated via flag checks but expedition can be created if only requester is eligible
		local qglobals		= eq.get_qglobals(e.self);
		local has_signets	= qglobals["oow_rss_taromani_insignias"]
		local has_trials	= qglobals["oow_mpg_raids_complete"]
		local is_gm			= (e.self:Admin() >= 80 and e.self:GetGM())

		-- the anguish door goes on a 60s cooldown after an expedition request
		-- while on cooldown clicking the door results in "feel the door" message and nothing happens

		-- when gate is not already on cooldown:
		-- if requester is in a non-anguish expedition then nothing happens
		-- if requester is in an anguish expedition it zones in without any message
		-- if above conditions pass, a creation request occurs and gate goes on cooldown ("the door swings wide" message)
		-- (unnecessary) cooldown added on a successful creation is probably to compensate for live's instance startup time
		local now = os.time()
		local is_anguish_door_on_cooldown = (anguish_door_cooldown_expire_time > now)

    if not is_gm and is_anguish_door_on_cooldown then
      e.self:Message(MT.Red, "You can feel the door to Anguish opening underneath your hand.")
    elseif not is_gm and not has_trials then -- unknown original live message
      e.self:Message(MT.Red, "You must complete the Muramite Proving Grounds raid trials.")
    elseif not is_gm and not has_signets then
		e.self:Message(MT.Red, "Though you carry the seal to enter Anguish, the Fallen Palace, you would be torn asunder by the harsh environment were you to venture within.  You will need to find a way to protect yourself from the powers of Discord.")
    else
      local dz = e.self:GetExpedition()
      if dz.valid and dz:GetZoneName() == "anguish" then
        e.self:MovePCDynamicZone("anguish")
      elseif not dz.valid then
        e.self:Message(MT.Yellow, "The door swings wide and allows you entrance to Anguish, the Fallen Palace.")

        dz = e.self:CreateExpedition(expedition_info)
        if dz.valid then
          dz:SetReplayLockoutOnMemberJoin(true) -- live doesn't add "Replay Timer" to new members after spawning aug droppers (bug or intentional?)
        else
          anguish_door_cooldown_expire_time = now + 60
          eq.debug(string.format("Anguish gate placed on 60s cooldown due to failed request by [%s]", e.self:GetCleanName()))
        end
      end
    end
  end
end
