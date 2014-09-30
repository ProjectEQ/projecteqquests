--[[ 
 Iqthinxa_Karnkvi (295130) qvic
 Also known as the "Zoo Event"
 At 75% boss goes inactive and spawns 3 Rav Adds
	Rav_Gernkki (295131)
	Rav_Karnkki (295133)
	Rav_Marnkki (295132)
 Adds must stay within 10% total health of each other or they
 get stronger and lock on to the top hate of the lowest HP Rav
 Once all the Ravs are dead, the boss goes active once more
]]--

---
-- @param NPC#event_spawn e
function event_spawn(e)
  eq.set_next_hp_event(75)
end

---
--@param NPC#event_hp e
function event_hp(e)
	--at 75% I go inactive and spawn my 3 Ravs
	eq.spawn2(295131,0,0,84,423,-410,84)
	eq.spawn2(295132,0,0,126,310,-422,232)
	eq.spawn2(295133,0,0,267,283,-410,124)
	eq.modify_npc_stat("special_attacks","ABfHG")
	--safety check for lost/missed signals from ravs & keep them within 10% of each other, otherwise have them all aggro lowest HP rav's top hate
	eq.set_timer("rav_check",10000)
	e.self:WipeHateList()
end

function event_signal(e)
	 --from Rav's when they die
 	 CheckRavs()
end

function event_timer(e)
	CheckRavs()
end

---
--@param NPC#CheckForRavs e
function CheckRavs()
	
  local rav1 = nil
  local rav2 = nil
  local rav3 = nil
  local RavCount = 0
    
    if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(295131) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(295132) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(295133)) then
      --All of the Ravs are dead. Go active
      eq.modify_npc_stat("special_attacks","SRTMCNIDf")
      eq.stop_all_timers()
   else
   	
    --If any of the 3 ravs is outside 10% threshold, aggro lowest HP's target on all 3 ravs
    --get ravs
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(295131)) then
      rav1 = eq.get_entity_list():GetMobByNpcTypeID(295131)
      RavCount = RavCount + 1
    end
    
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(295132)) then
 	    if (not rav1) then
   	   rav1 = eq.get_entity_list():GetMobByNpcTypeID(295132)
    	  RavCount = RavCount + 1
   	  else
    	  rav2 = eq.get_entity_list():GetMobByNpcTypeID(295132)
    	  RavCount = RavCount + 1
    	 end
    end
    
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(295133)) then
	      if (not rav1) then
	       	 rav1 = eq.get_entity_list():GetMobByNpcTypeID(295133)
	       	 RavCount = RavCount + 1
	      elseif (not rav2) then
	      	  rav2 = eq.get_entity_list():GetMobByNpcTypeID(295133)
	      	  RavCount = RavCount + 1
	      else
	       	 rav3 = eq.get_entity_list():GetMobByNpcTypeID(295133)
	      	 RavCount = RavCount + 1
	      end
     end
    
    --check to see if the difference in HP is greater than 10%
    local WhichRav = 0
    if (RavCount > 1) then
		if (RavCount == 2) then
    		if (math.abs(rav1:GetHPRatio() - rav2:GetHPRatio()) >= 10) then
     	 		if (rav1:GetHPRatio() < rav2:GetHPRatio()) then
        			WhichRav = 1
      			else
        			WhichRav = 2
      			end
    		end
		elseif (RavCount == 3) then
 			if (math.abs(rav1:GetHPRatio() - rav2:GetHPRatio()) >= 10 or math.abs(rav2:GetHPRatio() - rav3:GetHPRatio()) >= 10 or math.abs(rav1:GetHPRatio() - rav3:GetHPRatio()) >= 10) then
    			if (rav1:GetHPRatio() < rav2:GetHPRatio()) then
      				if (rav1:GetHPRatio() < rav3:GetHPRatio()) then
				        WhichRav = 1
				        
				    end
    			elseif (rav2:GetHPRatio() < rav3:GetHPRatio()) then
      				WhichRav = 2
      				
      			else
				    WhichRav = 3
    			end
  			end
    	end
    end
    
    
    local TopHate = nil
    if (WhichRav > 0) then
	      --There is a threshold over 10% and we know which rav is the lowest HP
	      eq.set_timer("rav_check",1000)
	      if (WhichRav == 1) then
	        	TopHate = rav1:GetHateTop()
	      elseif (WhichRav == 2) then
	        	TopHate = rav2:GetHateTop()        
	      elseif (WhichRav == 3) then
	        	TopHate = rav3:GetHateTop()
	      end
	      
	      --if the rav is up, make it lock on to the top hate of the lowest HP rav
	      --signal 2 says you're the lowest HP, get tougher
	      --signal 3 says you're not the lowest, get tougher, and emote that you are helping
	      	--quest::emote("goes into a frenzy to protect its wounded pack mate");
	      if (rav1 ~= nil) then
	      		rav1:WipeHateList()
	      		rav1:AddToHateList(TopHate,100000)
		        rav1:SetHate(TopHate,100000,1)
		        if (WhichRav == 1) then
		        	eq.signal(rav1:GetNPCTypeID(), 2)
		        else
		        	eq.signal(rav1:GetNPCTypeID(), 3)
		        end
		  end
	      if (rav2 ~= nil) then
	      		rav2:WipeHateList()
	      		rav2:AddToHateList(TopHate,100000)
		        rav2:SetHate(TopHate,100000,1)
		        if (WhichRav == 2) then
		        	eq.signal(rav2:GetNPCTypeID(), 2)
		        else
		        	eq.signal(rav2:GetNPCTypeID(), 3)
		        end
	      end
	      if (rav3 ~= nil) then
	      		rav3:WipeHateList()
	      		rav3:AddToHateList(TopHate,100000)
		        rav3:SetHate(TopHate,100000,1)
		        if (WhichRav == 3) then
		        	eq.signal(rav3:GetNPCTypeID(), 2)
		        else
		        	eq.signal(rav3:GetNPCTypeID(), 3)
		        end
	      end  
	   else
	   		--We don't have a WhichRav, which means they are within threshold
	   		--signal 1 says go back to normal strength
	   		if (rav1 ~= nil) then
	   			eq.signal(rav1:GetNPCTypeID(), 1)
	   		end
	   		if (rav2 ~= nil) then
	   			eq.signal(rav2:GetNPCTypeID(), 1)
	   		end
	   		if (rav3 ~= nil) then
	   			eq.signal(rav3:GetNPCTypeID(), 1)
	   		end
	   end
	end
end
