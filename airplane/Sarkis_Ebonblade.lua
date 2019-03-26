function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".  Have you come here to test your dark powers of skill and spell casting?");
	elseif(e.message:findi("dark powers of skill")) then
		e.self:Say("You will be tested by either Gragrot or Tynicon.  Choose one!");
	elseif((e.message:findi("Gragrot")) and (e.other:Class() == "Shadowknight")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71063,0,0,563.3,1351.9,-766.9,126.8); -- NPC: Gragrot
		eq.depop_with_timer();
	elseif((e.message:findi("Tynicon")) and (e.other:Class() == "Shadowknight")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71098,0,0,563.3,1351.9,-766.9,126.8); -- NPC: Tynicon_DLin
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
