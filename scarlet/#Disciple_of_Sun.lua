function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if(qglobals["monk_epic"] >= "5" and e.message:findi("hail")) then
		e.self:Say("I see you come in search of our ways. How can one such as yourself think that you have the power and pureness to challenge a Disciple of the Celestial Order? Very well though, if you wish to [" .. eq.say_link("challenge") .. "] me I shall enlighten you.");
	elseif(qglobals["monk_epic"] >= "5" and e.message:findi("challenge")) then	
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(21, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
	end
end

function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("depop", 900 * 1000);
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		e.self:Say("You have failed to prove yourself to be true. Be gone from my sight");
		eq.depop();
	end
end
