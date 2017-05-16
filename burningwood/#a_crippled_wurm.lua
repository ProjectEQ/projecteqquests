local kick_avail;

function event_combat(e)
	if e.joined==true then
		kick_avail=1;
		eq.set_timer("kickthatface",1000)
	end
end

function event_timer(e)
	if e.timer=="kickthatface" then
		if (e.self:CombatRange(e.self:GetTarget()) and kick_avail==1) then
			e.self:DoMeleeSkillAttackDmg(e.self:GetTarget(), 3500, 30);
			kick_avail=0;
			eq.set_timer("resetkick",8*1000);
		end
	elseif e.timer=="resetkick" then
		kick_avail=1;
	end
end