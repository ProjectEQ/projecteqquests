function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["monk_epic"] >= "8" and e.message:findi("hail")) then
		e.self:Say("I see you have found me once again. I have grown in strength since the last time the Order tried to defeat me. When the final blow was struck I was reborn in this world. The hatred within my heart gave me newfound strength. There was another far more powerful than the great Rallos Zek. He provided me this new shell and capabilites far superior than that which I could imagine. I am everlasting. If you wish to meet your god prepare to [" .. eq.say_link("die") .. "].");
	elseif(qglobals["monk_epic"] >= "8" and e.message:findi("die")) then
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
  if (e.joined == true) then
	eq.set_timer("depop", 1800 * 1000);
	eq.set_timer("breath", 10 * 1000);
	eq.set_timer("stun", 5 * 1000);
	eq.set_timer("relinq", 15 * 1000);
  end
end

function event_timer(e)
	if(e.timer=="depop") then
		eq.depop_with_timer();
	elseif(e.timer=="breath") then
		eq.stop_timer("breath");
		e.self:CastSpell(2308, e.self:GetTarget():GetID());	
		eq.set_timer("breath", 15 * 1000);
	elseif(e.timer=="stun") then
		eq.stop_timer("stun");
		e.self:CastSpell(1968, e.self:GetTarget():GetID());	
		eq.set_timer("stun", 18 * 1000);	
	elseif(e.timer=="relinq") then
		eq.stop_timer("relinq");
		e.self:CastSpell(5675, e.self:GetTarget():GetID());	
		eq.set_timer("relinq", 30 * 1000);			
	end
end