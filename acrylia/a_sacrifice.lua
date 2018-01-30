-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		local el = eq.get_entity_list();
		local ward = el:GetNPCByNPCTypeID(154155);
		if (ward.valid) then
			e.self:CastSpell(6974, ward:GetID()); -- cast Health Infusion on Ward of Death (154155) -- ??
		end
		eq.depop();
	end
end
