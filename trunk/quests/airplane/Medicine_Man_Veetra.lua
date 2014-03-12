function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you, " .. e.other:GetName() .. ". Are you a shaman of [much experience]?");
	elseif(e.message:findi("much experience")) then
		e.self:Say("Then welcome to the tests of the medicine man. I have two tomes, each tells of a shaman of great accomplishment. They are Gina MacStargan and Ooga. Simply tell me the name of the shaman you want to be tested by.");
	elseif((e.message:findi("Gina MacStargan")) and (e.other:Class() == "Shaman")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71087,0,0,631.9,1401.9,-766.9,129.8);
		eq.depop_with_timer();
	elseif((e.message:findi("Ooga")) and (e.other:Class() == "Shaman")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71093,0,0,653.4,1399.0,-766.9,129.8);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
