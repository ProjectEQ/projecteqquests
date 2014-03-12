function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ".  Do you feel that you are ready to be tested in song?");
	elseif((e.message:findi("tested in song")) and (e.other:Class() == "Bard")) then
		e.self:Say("The test of songs holds both joy and sorrow. Choose who you wish to begin with, Denise or Clarisa");
	elseif((e.message:findi("Clarisa")) and (e.other:Class() == "Bard")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71081,0,0,660.7,1388.9,-766.9,192.6);
		eq.depop_with_timer();
	elseif((e.message:findi("Denise")) and (e.other:Class() == "Bard")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71082,0,0,660.7,1368.4,-766.9,192.6);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
