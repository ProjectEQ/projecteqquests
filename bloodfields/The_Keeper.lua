function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "8" and e.message:findi("hail")) then
		e.self:Say("I see you have found me once again. I have grown in strength since the last time the Order tried to defeat me. When the final blow was struck I was reborn in this world. The hatred within my heart gave me newfound strength. There was another far more powerful than the great Rallos Zek. He provided me this new shell and capabilites far superior than that which I could imagine. I am everlasting. If you wish to meet your god prepare to [" .. eq.say_link("die") .. "].");
	elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "8" and e.message:findi("die")) then
		e.self:Say("It is useless to try and challenge me. Kaiaren will forever be lost within this land of discord!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:AddToHateList(e.other,1);
	elseif(e.message:findi("hail")) then
		e.self:Say("Is that your BREATH..or did something die in here..now go away!");
	end		
end

function event_combat(e)
  if e.joined then
	eq.set_timer("depop", 1800 * 1000);
	eq.set_next_hp_event(65);
  end
end

function event_hp(e)
	if(e.hp_event == 65) then
		e.self:Say("I shall show you how your soul will obey me!");
		eq.set_next_hp_event(35);
	elseif(e.hp_event == 35) then
		e.self:Say("You will cringe at the sound of my voice and your spirit shall be mine forever!");
	end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop_with_timer();
	end
end

