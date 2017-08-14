function event_signal(e)
	if e.signal==1 and e.self:GetMaxHP() > 1000000 then
		eq.modify_npc_stat("max_hp", tostring(e.self:GetMaxHP() - 1000000));
	end;
end;