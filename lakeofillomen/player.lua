function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	--on druid 1.5 and has Waterproof Collection Bag
	if(qglobals["druid_epic"] == "1" and qglobals["druid_epic_loio"] == nil and e.self:HasItem(62812)) then
		eq.spawn2(85234,0,0,-547,-734,-90,260);  -- #a_bloodgill_forager
		eq.spawn2(85235,0,0,-563,-734,-90,260); -- a_bloodgill_forager
		eq.spawn2(85235,0,0,-531,-734,-90,260); -- a_bloodgill_forager
		eq.set_global("druid_epic_loio","1",3,"M5");
	end	
end
