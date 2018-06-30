--eastwastes/player.lua  
--Warrior Epic 2.0
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	--on druid 1.5 and has Waterproof Collection Bag
	if(qglobals["druid_epic"] == "1" and qglobals["druid_epic_ew"] == nil and e.self:HasItem(62812)) then
		eq.spawn2(116608,0,0,4752,-9171,259,344);  -- #Ulthork_Raider
		eq.spawn2(116066,0,0,4750,-9150,259,344); -- an_ulthork_man_o_war
		eq.spawn2(116066,0,0,4750,-9192,259,344); -- an_ulthork_man_o_war
		eq.set_global("druid_epic_ew","1",3,"H2");
	end	
end
	
-- Not sure how to make map lead u to the trigger, after 8pm game time
