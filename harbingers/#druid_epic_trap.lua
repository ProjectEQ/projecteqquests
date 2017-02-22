function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
end
 
function event_enter(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(qglobals["druid_epic"] == "5" and qglobals["druid_epic_harb"] == nil) then
		eq.set_global("druid_epic_harb","1",2,"H2");
		eq.set_timer("depop",15*60*1000);
		eq.spawn2(335064, 0, 0, -1006.29,391.65,-93.02,108.6);
		eq.spawn2(335065, 0, 0, -993.86,397.86,-92.92,105.4);	
	end
end

function event_timer(e)
	if (e.timer=="depop") then
		eq.stop_timer("depop");
		eq.depop_all(335064); 
		eq.depop_all(335065);
	end
end