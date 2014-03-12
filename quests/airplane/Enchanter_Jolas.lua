function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Have you come here to test your powers of enchantment?");
	elseif(e.message:findi("enchantment")) then
		e.self:Say("I am most honored to be able to help you. Please choose from one of my instructors. Lelulean or Enderbite.");
	elseif((e.message:findi("Enderbite")) and (e.other:Class() == "Enchanter")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71085,0,0,640,1303.2,-766.9,0.4);
		eq.depop_with_timer();
	elseif((e.message:findi("lelulean")) and (e.other:Class() == "Enchanter")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71104,0,0,640,1303.2,-766.9,0.4);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
