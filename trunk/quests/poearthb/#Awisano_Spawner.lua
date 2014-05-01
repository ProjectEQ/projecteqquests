function event_spawn(e)
	eq.set_timer("depop", 60000);
end

function event_timer(e)
 
 	-- get a copy of the quest globals
 	local qglobals = eq.get_qglobals();
 
	local entity_list = eq.get_entity_list();
	
 	-- Check to see if any of the myrmadon_of_stone are up
 	local check_mrymadon = entity_list:GetMobByNpcTypeID(222002);
 
 	if (not check_mrymadon.valid and qglobals["poeb_Awisano"] == nil and qglobals["poeb_warlord"] == nil  ) then
 		eq.spawn2(222016, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
 		eq.stop_timer("depop");
 		eq.depop_with_timer();
 	end
 
end
