function event_spawn(e)
eq.set_timer("deactivate", 15 * 1000);
end

function event_timer(e)
	if (e.timer == "deactivate") then
    e.self:SetSpecialAbility(24, 1); --turn on immunity
    e.self:SetSpecialAbility(35, 1); --turn turn on immunity
		e.self:WipeHateList();
		eq.stop_timer("deactivate");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The assailant runs out of energy and crumbles to the ground.");
		e.Self:SetAppearance(3);
		eq.set_timer("depop", 5 * 1000); -- guessing 5 sec until depop at this point
	elseif (e.timer == "depop") then
		eq.depop();
	end
end
