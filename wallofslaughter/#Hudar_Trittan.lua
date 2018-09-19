--wallsofslaughter/#Hudar_Trittan.lua NPCID 300038 
--Shaman Epic 2.0
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_epic"] == "12") then
		e.self:Emote("looks from side to side before speaking. 'Tell me, what is your business? You here about the [" .. eq.say_link("caller") .. "]?");
	elseif(e.message:findi("caller") and qglobals["shaman_epic"] == "12") then
		e.self:Say("The dark spiritcaller. The one that is upsetting the balance of things here. I should not be speaking to your kind. It will put me in great danger. In that fortress, you will find a creature that is able to call spirits to its aid. It may look harmless at first, but do not be [" .. eq.say_link("fooled") .. "].");
	elseif(e.message:findi("fooled") and qglobals["shaman_epic"] == "12" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(300091) == false) then
		e.self:Say("You will need to be very patient and brave to overcome this beast. You will find it this very moment if you make haste. I must leave soon so you must best this creature alone.");
		eq.spawn2(300091,0,0, 734,265.8 ,129.5 ,384 ); --Discordling Spiritcaller
	end
end	

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
