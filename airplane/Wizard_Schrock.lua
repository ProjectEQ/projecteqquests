function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Do you believe that you are a [great Wizard]?");
	elseif(e.message:findi("great wizard")) then
		e.self:Say("I will not take your word for it! You must prove your greatness to my apprentices. Do you wish to be tested by Neasin or by Abec?");
	elseif((e.message:findi("Neasin")) and (e.other:Class() == "Wizard")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71092,0,0,585,1304.3,-766.9,0.1);
		eq.depop_with_timer();
	elseif((e.message:findi("Abec")) and (e.other:Class() == "Wizard")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71079,0,0,585,1304.3,-766.9,0.1);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
