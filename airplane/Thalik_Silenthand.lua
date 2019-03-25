function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Do you believe you are a great rogue?");
	elseif(e.message:findi("great rogue")) then
		e.self:Say("I will not take your word for it!  You must prove your greatness to one of my apprentices.  Do you wish to be tested by Rayne or by Kendrick?");
	elseif((e.message:findi("Rayne")) and (e.other:Class() == "Rogue")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71061,0,0,563.3,1372.6,-766.9,126.8); -- NPC: Rayne
		eq.depop_with_timer();
	elseif((e.message:findi("Kendrick")) and (e.other:Class() == "Rogue")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71068,0,0,563.3,1372.6,-766.9,126.8); -- NPC: Kendrick
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
