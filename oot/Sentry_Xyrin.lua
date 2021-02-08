-- items: 12134, 12135
function event_spawn(e)
	eq.set_timer("depop",3600000);
	-- eq.set_anim(69132,1);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhhh!! Keep quiet! Can you not tell this island is inhabited by undead? I wish to take the fight to them, but I am weak from the [boat disaster].");
	elseif(e.message:findi("boat disaster")) then
		e.self:Say("I was returning to my temple in Freeport in a small boat when the storm hit. I soon found myself shipwrecked on this evil island of undead. The words of Marr tell me to destroy these beings, but I am far too weak. If I only had a sip of the [Potion of Marr].");
	elseif(e.message:findi("potion of marr")) then
		e.self:Say("The Potion of Marr was created for the Sentries of Passion. It makes us alert and energetic. It will work only on sentries such as myself. It is distributed by Serna Tasknon of the Temple of Marr in Freeport.");
		eq.start(62);
		e.self:SetRunning(true);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12134})) then
		e.self:Say("I thank you. I cannot do battle at this moment. I am summoned elsewhere. May Marr guide you from this isle.");
		e.other:SummonItem(12135); -- Item: Empty Potion of Marr
		e.other:Ding();
		e.other:Faction(362,5,0); -- Faction: Priests of Marr
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,5,0); -- Faction: Knights of Truth
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Shout("Long live Marr !!");
	elseif(e.wp == 5) then
		e.self:Say("Many thanks to all who aided in this battle. I offer you this, a weapon I found on a slain Erudite paladin. May Marr watch over his soul and may Marr guide yours. Now I must go.");
		eq.create_ground_object(5414,-6963,-886,139,0,1800000); -- deepwater harpoon
		eq.depop();
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
