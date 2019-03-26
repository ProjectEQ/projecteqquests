function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Are you pure of heart and soul?");
	elseif(e.message:findi("Heart and Soul")) then
		e.self:Say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
	elseif(e.message:findi("Gregori")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71089,0,0,563,1331.1,-766.9,126.8); -- NPC: Gregori_Lightbringer
		eq.depop_with_timer();
	elseif(e.message:findi("Dirkog")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71077,0,0,563,1331.1,-766.9,126.8); -- NPC: Dirkog_Steelhand
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
