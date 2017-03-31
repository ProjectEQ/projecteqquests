function event_enter_zone(e)
  	if(e.self:HasItem(12080)) then -- Player has Enchated Signet of Disciples on their character and Zones in.
    		e.self:Message(15, "The Signet begins to glow");
	end
	
	if(e.self:HasItem(69941) and e.self:HasItem(69952) and e.self:HasItem(69942) and e.self:HasItem(69983)) then -- Paladin 1.5 trigger
    	local qglobals = eq.get_qglobals(e.self);
		if(qglobals["paladin_wos"] ==  nil) then
			eq.spawn2(300087,0,0,-1118.76,1007,13.45,113);
			eq.set_global("paladin_wos","1",3,"H2");			
		end		
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
	end
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  local instance_id = nil;

  local lockouts = {
      { "Anguish_keldovan", "Anguish: Keldovan the Harrier" },
      { "Anguish_jelvan", "Anguish: Rescing Jelvan" },
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
      e.self:MovePCInstance(317, instance_id, -9, -2466, -79, 255);
    else 
      local instance_requests = require("instance_requests");

      -- Every member of the raid needs to have 2 quest_globals set: oow_rss_taromani_insignias and oow_mpg_raids_complete
      local required_globals = {
        {'oow_rss_taromani_insignias', "is not protected from the chaos magic in Mata Muram's citadel." },
        {'oow_mpg_raids_complete', 'must complete the Muramite Proving Grounds raid trials'}
      };
      --local request = instance_requests.ValidateRequest('raid', 'anguish', 0, 2, 54, 65, {}, e.self, lockouts );
      local request = instance_requests.ValidateRequestNew('raid', 'anguish', 0, 2, 54, 65, {}, required_globals, e.self, lockouts);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.self, e.self, lockouts);
      elseif (request.valid and request.flags == 0) then
        instance_id = eq.create_instance('anguish', 0, 10800);
        eq.assign_raid_to_instance(instance_id);
        e.self:Message(14, "Anguish is open to you");

        -- Set the lockout for the instance with the bits that represent the mobs that 
        -- will be spawned by the zone_status upon entry
        eq.set_global(instance_id.."_anguish_bit",tostring(request.flags),7,"H6");

        -- Set a 2h lockout on the members of the raid
        local player_list = eq.get_characters_in_instance(instance_id);
        local lockout_name = 'anguish';
        for k,v in pairs(player_list) do
          eq.target_global(lockout_name,tostring(instance_requests.GetLockoutEndTimeForHours(2)), "H2", 0, v, 0);
        end
        eq.cross_zone_message_player_by_name(5, "GMFizban", "Anguish -- Instance: " .. instance_id);
      end
    end
  end

end
