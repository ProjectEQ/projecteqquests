function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] >= "7" and e.message:findi("hail")) then
		e.self:Say("I know what you seek and you will have to go through me to get to it. This feat will be your undoing but if you [" .. eq.say_link("insist") .. "] I will provide you a quick demise.");
	elseif(qglobals["monk_epic"] >= "7" and e.message:findi("insist")) then
		e.self:Say("Prepare to meet your god, fool!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(21, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
	elseif(e.message:findi("hail")) then
		e.self:Say("Get out of my face. I have no time for you.");
	end		
end

function event_combat(e)
  if (e.joined == true) then
	eq.set_timer("depop", 1800 * 1000);
	eq.set_next_hp_event(75);
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop_with_timer();
	end
end

function event_hp(e)
	if(e.hp_event == 75) then
		eq.set_next_hp_event(50);
		eq.spawn2(301038,0,0,-1163,-462,-930,181);
		eq.spawn2(301039,0,0,-1163,-485,-930,181);
	elseif(e.hp_event == 50) then
		eq.set_next_hp_event(25);
		eq.spawn2(301038,0,0,-1163,-462,-930,181);
		eq.spawn2(301039,0,0,-1163,-485,-930,181);
	elseif(e.hp_event == 25) then
		eq.spawn2(301038,0,0,-1163,-462,-930,181);
		eq.spawn2(301039,0,0,-1163,-485,-930,181);
	end
end