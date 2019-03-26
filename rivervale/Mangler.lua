function event_spawn(e)
	eq.set_timer("mangler",720000);
end

function event_timer(e)
	e.self:Say("<Bark, bark, bark! Hoooooowwwwwwl!>");
	eq.signal(19049,1); -- NPC: Kevlin_Diggs Armor
end
