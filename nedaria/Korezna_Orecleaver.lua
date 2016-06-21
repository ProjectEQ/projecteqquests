--nedaria/Korezna_Orecleaver.lua NPCID 
--Warrior Epic 1.5
function event_spawn(e)
	e.self:Say("Ugh, too hot in here. I can't really... ... talk until I've gotten cooled down a bit. Do you have anything that I can cool down with, maybe some water?");
end	

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 13006, item2 = 13006, item3 = 13006, item4 = 13006}) ) then --4x Water Flask
		e.self:Say("That helps, but I'm still too hot! More... water... please!");
		eq.set_global("warrior_epic_korezna","1",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13006, item2 = 13006, item3 = 13006}) and qglobals["warrior_epic_korezna"] == "1") then --3x Water Flask
		e.self:Say("Phew, thanks much for helping me cool down a bit. I guess you never realize how hot it can get working in here all the time. So anyway, what do you need worked on?");
		eq.set_global("warrior_epic_korezna","2",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 60301, item2 = 60302}) and qglobals["warrior_epic_korezna"] == "2") then -- Blackfall Ore and Smelting Plans
		e.self:Say("Ooh, that's an interesting ore. Don't think I've ever seen anything like it before. Seems as though your friend knows all about it already though, huh? Alrighty, let me get down to the forge so I can work on this for you. Give me just a minute.");
		--delay here
		e.self:Say("Nice looking blade, I must say. I'm hope whoever this is for will be happy with the results. I'm gonna get back up to my post now, have a lot of work to get done still. Thanks for stopping by!");
		eq.delete_global("warrior_epic_korezna");
		e.other:SummonItem(60303); --Blackfall Blade
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	