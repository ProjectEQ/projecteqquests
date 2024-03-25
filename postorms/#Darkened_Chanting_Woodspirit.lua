function event_spawn(e)
	eq.set_timer("depop", 2 * 60 * 1000); -- 2 Minutes
end

function event_combat(e)
	if e.joined then
		eq.spawn2(210251, 0, 0, e.self:GetX()-25, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()+25, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX(), e.self:GetY()-25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX(), e.self:GetY()+25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()+25, e.self:GetY()-25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()-25, e.self:GetY()+25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.stop_timer("depop")
		eq.set_timer("aggrolink", 3 * 1000);
	else
		eq.set_timer("depop", 2 * 60 * 1000); -- 2 Minutes
		eq.stop_timer("aggrolink")
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop")
		eq.depop();
	elseif e.timer == "aggrolink" then
		local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 210251)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add #a_woodspirit_vineguard to aggro list if alive
		end
		end
	end
end
