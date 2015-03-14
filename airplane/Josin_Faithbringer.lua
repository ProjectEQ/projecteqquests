function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Are you ready to begin your test of faith?");
	elseif((e.message:findi("test of faith")) and (e.other:Class() == "Cleric")) then
		e.self:Say("I have faith that you will do well. Choose Alan or Deric");
	elseif((e.message:findi("Alan")) and (e.other:Class() == "Cleric")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71080,0,0,660.7,1361.6,-766.9,193.2);
		eq.depop_with_timer();
	elseif((e.message:findi("Deric")) and (e.other:Class() == "Cleric")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71083,0,0,660.7,1338.0,-766.9,193.2);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
