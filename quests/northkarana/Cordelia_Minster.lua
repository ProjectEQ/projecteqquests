-- Winds of Karana
-- Broken Lute

function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 3 or e.wp == 8) then
		e.self:SetRunning(true);
	elseif(e.wp == 2 or e.wp == 6 or e.wp == 10) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  I am Cordelia, a traveling piper. I am afraid I cannot play a tune for you, however, as my [flute] is gone.");
	elseif(e.message:findi("flute")) then
		e.self:Say("I traded my flute to a hermit in the southern plains of Karana. I had a spare flute, but that was taken from me by some bandits. If you could find this hermit and ask him for my flute back, I would be most appreciative.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13310})) then -- A cracked Flute
		e.self:Say("Why thank you, kind adventurer! Here is a little something to keep food in your belly. Now back to practice. La la la..");
		e.other:SummonItem(13119); -- Winds of Karana sheet 2
		e.other:Ding();
		e.other:Faction(135,2,0);
		e.other:Faction(184,2,0);
		e.other:Faction(192,2,0);
		e.other:Faction(207,-5,0);
		e.other:Faction(273,-5,0);
		e.other:AddEXP(1000);
		e.other:GiveCash(0,2,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE zone:northkarana ID:13037 -- Cordelia_Minster.pl