-- revamped version of Ocean of Tear "Sentry Xyrin" script.

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhhh!! Keep quiet! Can you not tell this island is inhabited by undead? I wish to take the fight to them, but I am weak from the [boat disaster].");
		eq.set_timer("shout",60000);
		eq.set_timer("depop",600000);
	elseif(e.message:findi("boat disaster")) then
		e.self:Say("I was returning to my temple in Freeport in a small boat when the storm hit. I soon found myself shipwrecked on this evil island of undead. The words of Marr tell me to destroy these beings, but I am far too weak. If I only had a sip of the [Potion of Marr].");
	elseif(e.message:findi("potion of marr")) then
		e.self:Say("The Potion of Marr was created for the Sentries of Passion. It makes us alert and energetic. It will work only on sentries such as myself. It is distributed by Serna Tasknon of the Temple of Marr in Freeport.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12134})) then
		e.self:Say("I thank you. I cannot do battle at this moment. I am summoned elsewhere. May Marr guide you from this isle.");
		e.other:SummonItem(12135);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	if(e.timer == "depop") then
		e.self:Say("Many thanks to all who aided in this battle. I offer you this, a weapon I found on a slain Erudite paladin. May Marr watch over his soul and may Marr guide yours. Now I must go.");
		eq.create_ground_object(5414,xloc,yloc,zloc,0,150000); -- deepwater harpoon
		eq.depop_with_timer();
	elseif(e.timer == "shout") then
		e.self:Shout("Long live Marr !!");
		eq.stop_timer("shout");
	end
end