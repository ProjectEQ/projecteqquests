function event_spawn(e)
	eq.set_timer("depop", 59000);
end

function event_timer(e)
	-- get quest globals
	local qglobals = eq.get_qglobals();

	-- get the list of NPCs in the zone
   local entity_list = eq.get_entity_list();

	-- Check to see if the Stonefist Clansman are up
	local check_stonefist = entity_list:GetMobByNpcTypeID(222001);

	if (not check_stonefist.valid and qglobals["poeb_Birak"] == nil and qglobals["poeb_warlord"] == nil ) then
		eq.spawn2(222017, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		eq.stop_timer("depop");
		eq.depop_with_timer();
	end
end
