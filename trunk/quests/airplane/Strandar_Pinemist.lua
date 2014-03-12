function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, young one. Are you a [child of the trees]?");
	elseif(e.message:findi("child of the trees")) then
		e.self:Say("Then you are welcome in my presence. I shall call forth some loyal children if you but speak the name. Will or Fenalla will serve you well.");
	elseif((e.message:findi("Will")) and (e.other:Class() == "Druid")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71099,0,0,563,1311.4,-766.9,65.4);
		eq.depop_with_timer();
	elseif((e.message:findi("Fenalla")) and (e.other:Class() == "Druid")) then
		e.self:Say("I will summon him for you then");
		eq.spawn2(71086,0,0,562.5,1329.3,-766.9,65.4);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
