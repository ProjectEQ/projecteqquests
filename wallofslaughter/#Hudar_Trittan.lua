--wallsofslaughter/#Hudar_Trittan.lua NPCID 300038 
--Shaman Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_epic"] == "10") then
		e.self:Message(0,"looks from side to side before speaking. 'Tell me, what is your business? You here about the [caller]?");
	elseif(e.message:findi("caller") and qglobals["shaman_epic"] == "10") then
		e.self:Say("The dark spiritcaller. The one that is upsetting the balance of things here. I should not be speaking to your kind. It will put me in great danger. In that fortress, you will find a creature that is able to call spirits to its aid. It may look harmless at first, but do not be [fooled].");
	elseif(e.message:findi("fooled") and qglobals["shaman_epic"] == "10") then
		e.self:Say("You will need to be very patient and brave to overcome this beast. You will find it this very moment if you make haste. I must leave soon so you must best this creature alone.");
		--eq.spawn2( ,0,0, , , , ); --Discordling Spiritcaller
		--may spawn with 2 guards, cant find consistant info on the fight
	end
end	

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
