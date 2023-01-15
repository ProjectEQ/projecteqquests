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
	local npc_list =  eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 64092)) then
		npc:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
		end
	end
end
