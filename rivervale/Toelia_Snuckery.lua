-- items: 13785, 13786
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Oh. hi.  Listen. um.. " .. e.other:GetName() .. ". was it?  Listen. pal.  I really don't have time for the friendly-friendly. so why don't you just move on?");
	elseif(e.message:findi("new dishwasher") and fac == 5) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif(e.message:findi("new dishwasher") and fac < 5) then
		e.self:Say("Dishwasher, huh?  You must not mind getting your feet wet then, huh?  Well, I do have a job for you.  It seems one of our younger employees got a little nevous around a Deputy and ditched his um..  recent purchase into the river.  We sent the fool after it but ol' [Chomper] got him.  He said he had dropped it off the docks but the currents might have moved it from there.  It should be in an old pouch.  Return the merchandise to me.  Well?  Get going!");
	elseif(e.message:findi("chomper")) then
		e.self:Say("Chomper is a big, mean ol' fish.  He looks like a normal fish, but a little bigger, and boy, oh boy, is he mean!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13785})) then
		e.self:Say("What is this?  The pouch is empty!  Where is the Ruby?!  What do you mean you don't have it?  Oh no.  I bet [Chomper] swallowed it!  Get it back and bring it to me.");
		e.other:Ding();
		e.other:Faction(241,5,0); -- Faction: Deeppockets
		e.other:Faction(223,5,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(292,-5,0); -- Faction: Merchants of Rivervale
		e.other:Faction(336,5,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(329,5,0); -- Faction: Carson McCabe
		e.other:AddEXP(500);
		e.other:GiveCash(2,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13786})) then
		e.self:Say("You found it!  Heh.  Good thing you brought it back bub.  This thing isn't priceless, its worthless but at least you proved you are loyal.  Poor ol' Chomper..");
		e.other:Ding();
		e.other:Faction(241,10,0); -- Faction: Deeppockets
		e.other:Faction(223,10,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(292,-10,0); -- Faction: Merchants of Rivervale
		e.other:Faction(336,10,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(329,10,0); -- Faction: Carson McCabe
		e.other:AddEXP(1000);
		e.other:GiveCash(0,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19063 -- Toelia_Snuckery 
