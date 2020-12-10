--340428


function event_spawn(e)
	e.self:SetSpecialAbility(19, 1);
	e.self:SetSpecialAbility(20, 1);
	e.self:SetSpecialAbility(25, 1);
	e.self:SetSpecialAbility(24, 1);
	e.self:SetSpecialAbility(35, 1);
end

function event_timer(e)
	if (e.timer == "chat") then
		e.self:Say("Ah, yes. You must forgive Fire, for he cares little for pleasantries. It is part of his charm. You most certainly will be worthy opponents. I am honored to face you.");
		eq.stop_timer("chat");
	end
end


function event_signal(e)
	if (e.signal == 1) then
		eq.set_timer("chat", 40000);
		e.self:SetGrid(14);
		eq.start(14);
	elseif (e.signal == 2) then
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(e.self:GetTarget(),1);
	end
end

function event_death_complete(e)
	eq.signal(340416,340428);
end
