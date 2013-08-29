function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Welcome into our church of rage.  I am Vesagar Nekio. servant of Innoruuk.  If you should need me to [cure poison]. [cure disease]. or if you [require healing]. just let me know.");
	elseif(e.message:findi("cure poison") and fac <= 4) then
			e.self:Say("Ally of the Dismal Rage,  Be free of poison!!");
			e.self:CastSpell(203,e.other:GetID());
	elseif(e.message:findi("cure disease") and fac <= 4) then
			e.self:Say("Ally of the Dismal Rage,  Be free of disease!!");
			e.self:CastSpell(213,e.other:GetID());
	elseif(e.message:findi("require healing") and fac <= 4) then
			e.self:Say("Ally of the Dismal Rage,  Be healed of all your wounds!!");
			e.self:CastSpell(13,e.other:GetID());
	elseif((e.message:findi("cure poison") or e.message:findi("cure disease") or e.message:findi("require healing")) and fac > 4) then
		e.self:Say("Blasphemer!!  You are no ally of the Dismal Rage.  Run while you still have legs!!");
	end
end

-- END of FILE Zone:freporte -- Vesagar_Nekio
