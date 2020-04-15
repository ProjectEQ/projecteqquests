function event_combat(e)
	if e.joined==true then
		eq.spawn2(210251, 0, 0, e.self:GetX()-25, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()+25, e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX(), e.self:GetY()-25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX(), e.self:GetY()+25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()+25, e.self:GetY()-25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
		eq.spawn2(210251, 0, 0, e.self:GetX()-25, e.self:GetY()+25, e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_woodspirit_vineguard
	else
		eq.set_timer("depop",15*60*1000)
	end
end

function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop")
		eq.depop();
		eq.depop_all(210251);
	end
end