function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Peace to you, " .. e.other:GetName() .. ".  I see that you have come far along the path of tranquility and enlightenment.  Do you wish to test yourself further, and perhaps complete the path you started on so long ago?");
	elseif((e.message:findi("tranquility and enlightenment")) and (e.other:Class() == "Monk")) then
		e.self:Say("Choose you path. Wu or Ton Po");
	elseif((e.message:findi("wu")) and (e.other:Class() == "Monk")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71097,0,0,660.0,1332.3,-766.9,379.8); -- NPC: Wu_the_Enlightened
		eq.depop_with_timer();
	elseif((e.message:findi("ton po")) and (e.other:Class() == "Monk")) then
		e.self:Say("I shall summon them for you");
		eq.spawn2(71096,0,0,660.0,1315.0,-766.9,379.8); -- NPC: Ton_Po
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
