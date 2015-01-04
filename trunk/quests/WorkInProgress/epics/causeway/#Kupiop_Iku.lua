--causeway/Kupiop_Iku.lua NPCID 303060
--Shaman Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_epic"] == "9") then
		e.self:Say("Ah, I see you are a friend of the spirits and a heyokah in your own right. There is a pack of foul creatures nearby and one that rules them all. I believe the Elder Spirit of Enlightenment would like you to take of this creature and return an essence stolen from our world. If you are [ready], say so, and perhaps we can be rid of these beasts.");
	elseif(e.message:findi("ready") and qglobals["shaman_epic"] == "9") then
		e.self:Say("Not far down this path in a hive of its own, these beasts lurk. Go now, lest you should miss it before it moves on. I must depart. Good luck.");
		--eq.spawn2( ,0,0, , , , ) --epic version of Murkglider_School_Leader
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	