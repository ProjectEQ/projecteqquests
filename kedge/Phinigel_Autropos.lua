function event_combat(e)
	if (e.joined) then
		eq.set_timer("help", 5 * 60 * 1000);
		HelpMe(e);
	else
		eq.stop_timer("help");
	end
end

function event_timer(e)
	if(e.timer == "help") then
		HelpMe(e);
	end
end

function HelpMe(e)
	local swirlspine = eq.get_entity_list():GetMobByNpcTypeID(64092);
	
	if (swirlspine.valid) then
		swirlspine:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
	end
end
