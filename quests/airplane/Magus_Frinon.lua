function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Have you come here to test your abilities as a magician?");
	elseif(e.message:findi("magician")) then
		e.self:Say("Choose your tester. Frederic or Roanis.");
	elseif((e.message:findi("Frederic")) and (e.other:Class() == "Magician")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71088,0,0,614.5,1304.1,-766.9,255);
		eq.depop_with_timer();
	elseif((e.message:findi("Roanis")) and (e.other:Class() == "Magician")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71094,0,0,614.5,1304.1,-766.9,255);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
