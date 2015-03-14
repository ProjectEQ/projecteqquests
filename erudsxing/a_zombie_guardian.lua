function event_signal(e)
	e.self:ClearSpecialAbilities();
	e.self:SetBodyType(3, false);
	
	eq.attack_npc(e.signal);
end