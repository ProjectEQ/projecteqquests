function event_say(e)
	-- this is a hack/work around until the expedition system is implemented.
	if (e.message:findi("hail")) then
		--e.other:Message(0,"You dare to take an [" .. eq.say_link("expedition",false,"expedition") .. "] in the [" .. eq.say_link("Citadel of Anguish",false,"Citadel of Anguish") .. "]?");
		e.other:Message(0,"You dare to take an [" .. eq.say_link("expedition",false,"expedition") .. "] in the Citadel of Anguish?");
	--[[elseif (e.message:findi("setglobal")) then
		eq.set_global("MPG_adaptation", "1", 5, "H108");
	elseif (e.message:findi("deleteglobal")) then
		eq.delete_global("oow_mpg_raids_complete");
		eq.delete_global("MPG_adaptation");
		eq.delete_global("MPG_corruption");
		eq.delete_global("MPG_endurance");
		eq.delete_global("MPG_foresight");
		eq.delete_global("MPG_hatred");
		eq.delete_global("MPG_specialization");
		eq.delete_global("mpg_raid_trials"); ]]--	
	elseif(e.message:findi("expedition")) then
		local inst_id =  eq.get_instance_id('anguish', 0);
		local in_an_instance = false;
		if inst_id > 0 then 
			in_an_instance = true 
			e.other:Message(0,"Click the link if you wish to leave: " .. eq.say_link("leave " .. inst_id,false,"Anguish"));
		else
			e.other:Message(1,"You are not a member of an expedition!");
		end
	elseif(e.message:findi("leave")) then
		local inst_id =  eq.get_instance_id('anguish', 0);


    -- Make sure all the people from the instance are in the zone and are removed properly.  
    -- There can be problems/exploits if people are in the instanced zone and removed
    -- from the instance.
    local char_list = eq.get_characters_in_instance(inst_id);
    local all_members_here = true;
    local member;
    --    for i = 0, player_list_count - 1, 1 do
    for k,v in pairs(char_list) do
      member = eq.get_entity_list():GetClientByCharID(v);
      if (member.valid == false) then
        e.other:Message(13, "All members of the instance need to be in " .. eq.get_zone_long_name() .. " in order to dissolve the instance.");
        all_members_here = false;
      end
    end
			  
    if (all_members_here == true) then 
      local instance_id;		
      for i in string.gmatch(e.message, "%S+") do
        if (tonumber(i)) then
          instance_id = tonumber(i);
        end
      end

      if(inst_id == instance_id) then
        local charid_list=eq.get_characters_in_instance(instance_id);
        for k,v in pairs(charid_list) do
          eq.target_global(inst_id.."_anguish_bit", "0", "1", 0,v, 0);
        end	
        eq.remove_all_from_instance(inst_id);
      end
    end
	--[[
	elseif(e.message:findi("Citadel of Anguish")) then
	  -- 1  (Hate)       Mastery of Mind Rune 52407
	  -- 2  (Endurance)  Mastery of Body Rune 52408
	  -- 4  (Foresight)  Mastery of Tactics Rune 52409
	  -- 8  (Spec)       Mastery of Arcana Rune 52410
	  -- 16 (Adaptation) Mastery of Realms Rune 52411
	  -- 32 (Corruption) Mastery of Power Rune 52412	
		local qglobals = eq.get_qglobals(e.other);
		local mpg_raid_trials = tonumber(qglobals['mpg_raid_trials']);
		--e.self:Say("mpg_raid_trials: " .. mpg_raid_trials);
		if (qglobals["oow_mpg_raids_complete"] ~= nil) then
			e.other:Message(14,"You have already proven yourself worthy to step foot in Anguish");
		elseif(qglobals["MPG_adaptation"] ~=nil and qglobals["MPG_corruption"] ~=nil and qglobals["MPG_endurance"] ~=nil and qglobals["MPG_foresight"] ~=nil and qglobals["MPG_hatred"] ~=nil and qglobals["MPG_specialization"] ~=nil and qglobals["oow_mpg_raids_complete"] == nil) then			
			e.other:Message(14,"You have demonstrated adeptness at all aspects of power that Mata Muram holds dear. As you receive the final medal, the six wedges you have collected fuse, point to point, creating a hexagonal seal.  You now hold the key to Anguish, the Fallen Palace");
			eq.set_global("oow_mpg_raids_complete", "1", 5, "F");
			eq.set_global("mpg_raid_trials", "63", 5, "F");
			e.other:SummonItem(52413) -- Seal: Mastery of All			
		else
			e.other:Message(13,"You lack mastery required to enter the Citadel of Anguish");		
			if (qglobals["MPG_adaptation"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,16)==0)) then e.other:Message(13,"You have not acquired a Mastery of Adaptation");	end;
			if (qglobals["MPG_corruption"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,32)==0)) then e.other:Message(13,"You have not acquired a Mastery of Corruption");	end;
			if (qglobals["MPG_endurance"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,2)==0)) then e.other:Message(13,"You have not acquired a Mastery of Endurance"); end;
			if (qglobals["MPG_foresight"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,4)==0)) then e.other:Message(13,"You have not acquired a Mastery of Foresight"); end;
			if (qglobals["MPG_hatred"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,1)==0)) then e.other:Message(13,"You have not acquired a Mastery of Hated"); end;
			if (qglobals["MPG_specialization"] ==nil and (mpg_raid_trials==nil or bit.band(mpg_raid_trials,8)==0)) then e.other:Message(13,"You have not acquired a Mastery of Specialization"); end;
		end ]]--
	end
end
