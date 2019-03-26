function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you a true servant of the Pine?");
	elseif(e.message:findi("servant of the pine") and e.other:Class() == "Ranger") then
		e.self:Say("Very well my friend. In order to reach your true potential you must pass many tests. Relinin Skyrunner and Gordon Treecaller are here to perform these tests. Please choose one.");
	elseif(e.message:findi("Relinin Skyrunner") and e.other:Class() == "Ranger") then
		e.self:Say("I shall summon him for you then");
		eq.spawn2(71095,0,0,617.1,1399.5,-766.9,258.8); -- NPC: Relinin_Skyrunner
		eq.depop_with_timer();
	elseif(e.message:findi("Gordon Treecaller") and e.other:Class() == "Ranger") then
		e.self:Say("I shall summon him for you then");
		eq.spawn2(71090,0,0,592.8,1400.1,-766.9,258.8); -- NPC: Gordon_Treecaller
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
