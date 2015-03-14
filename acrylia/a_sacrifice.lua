-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:CastSpell(6974,154155); -- cast Health Infusion on Ward of Death (154155) -- ??
--		quest::castspell(154155,6974); -- cast Health Infusion on Ward of Death (154155)
		eq.depop();
	end
end
