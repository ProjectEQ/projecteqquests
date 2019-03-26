function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you a [true warrior]?");
	elseif(e.message:findi("true warrior")) then
		e.self:Say("Then you shall be tested as one. Choose. Do you wish to be tested by Falorn or Ogog?");
	elseif((e.message:findi("falorn")) and (e.other:Class() == "Warrior")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71067,0,0,563.3,1392.4,-766.9,126.8); -- NPC: Falorn
		eq.depop_with_timer();
	elseif((e.message:findi("ogog")) and (e.other:Class() == "Warrior")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71064,0,0,563.3,1392.4,-766.9,126.8); -- NPC: Ogog
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
