function event_combat(e)
	if e.joined==true then
		e.self:Emote("attacks as it senses the presence of the meddlesome Norrathian shaman in a desperate attempt to protect the spirit essence that animates it.");
		eq.spawn2(316074, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_lightning_warrior_spiritsapper
		eq.spawn2(316074, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #a_lightning_warrior_spiritsapper
	else
		eq.set_timer("depop",15*60*1000)
	end
end

function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop")
		eq.depop_all(316074);
		eq.depop();
	end
end