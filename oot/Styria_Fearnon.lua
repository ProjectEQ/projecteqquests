function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my island. I always welcome visitors, but I would prefer that your stay not last too long. My warriors are sometimes tempted by others. That is why they all wear purity belts. I should warn you, also, to be on the lookout for the [Pirates of Gunthak].");
	elseif(e.message:findi("pirates of gunthak")) then
		e.self:Say("The Pirates of Gunthak have been stranded on a nearby island. Their ship was sunk by some unknown water beast. They now attempt to take over this island and commandeer the first ship they encounter. I am looking for brave [adventurers] to hunt the rogues. Do you wish to hunt the pirates or are you waiting for the next ship?");
	elseif(e.message:findi("adventurer")) then
		e.self:Say("Go and seek them out. They are on a nearby island. You will have to swim if you have no boat. Each pirate wears the pirate earring of the Pirates of Gunthak. I shall reward you for each earring you return to me. They have also stolen the Bracers of Erollisi from us. Their leader may have the pair. Return it to me and I shall be very appreciative.");
	elseif(e.message:findi("sentry xyrin")) then
		e.self:Say("What? Why are you so concerned for Sentry Xyrin? She returned to Freeport last night right before.. Oh!! Oh, dear!! Right before the storm hit. If she did not make it back to Freeport. I fear she has drowned or is shipwrecked upon one of the nearby islands!! You must find her!");
		eq.unique_spawn(69132,0,0,-7332,-612,1,90);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13337})) then -- Bracers of Erollisi 
		e.self:Say("Good work. I see you have removed that retchid pirate from here.");
		e.other:SummonItem(eq.ChooseRandom(13339,13342,7017,13340));
		e.other:Ding();
		e.other:Faction(99,5,0); -- Faydarks Champoins
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(304,5,0); -- Soldiers of Tunare
		e.other:Faction(43,5,0); -- Clerics of Tunare
		e.other:Faction(63,-10,0); -- Crushbone Orcs
		e.other:AddEXP(250);
		e.other:GiveCash(0,5,5,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13336})) then -- Pirate Earrings
		e.self:Say("Good work. I see you have removed that retchid pirate from here.");
		e.other:SummonItem(eq.ChooseRandom(13339,13342,7017,13340));
		e.other:Ding();
		e.other:Faction(99,5,0); -- Faydarks Champoins
		e.other:Faction(178,5,0); -- King Tearis Thex
		e.other:Faction(304,5,0); -- Soldiers of Tunare
		e.other:Faction(43,5,0); -- Clerics of Tunare
		e.other:Faction(63,-10,0); -- Crushbone Orcs
		e.other:AddEXP(100);
		e.other:GiveCash(0,1,4,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
