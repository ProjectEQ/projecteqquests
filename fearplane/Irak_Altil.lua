-- Paladin Epic 1.0
-- NPCID: 72078
-- Zone: fearplane
-- items: 29010, 11050, 10099

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("turns its head upon its dried, cracked spine to look at you with a rictus grin. After staring through you it continues to walk on.");
	end
	if(e.message:findi("what are you mumbling about")) then
		e.self:Emote("turns its rotted eyesockets towards you. 'Fallen light, upon this ground I fell. Left to rot, cast out. My holy arms stripped and my soul cast out of the halls. Twisted, failed, disgraced.'");
	end
	if(e.message:findi("disgraced")) then
		e.self:Say("Disgrace upon my soul for failing in my duties. Disgrace of my brethren.");
	end
	if(e.message:findi("duties")) then
		e.self:Emote("breathes his words from his skeletal mouth as if wind through a valley. 'Sword, shield, breastplate. Twisted to Innoruuks foul will. Must be retrieved and cleansed else my soul is to wander for all time.'");
	end
	if(e.message:findi("sword")) then
		e.self:Say("Hands of a twisted brother no longer living.");
	end
	if(e.message:findi("shield")) then
		e.self:Say("Earthly children of the god of hate. Keeping stand over his dark brothers and sisters.");
	end
	if(e.message:findi("breastplate")) then
		e.self:Emote("lets loose an unearthly howl as it gleams with sickly light. 'Upon she who lured me from my post. In that place where hatred festers. Painful corruption.'");
	end
	if(e.message:findi("cleansed")) then
		e.self:Say("The sword must be dipped in water pure. Light of clean spirit to cleanse the shield. A gem of clarity unlike any other for the breastplate. All must be cleansed and returned to the temple for my soul to be freed. Only the temple can cleanse, only they can touch the artifacts. Take the sets of two to the temple. When they are all three cleansed separately take them to him who will grant me atonement.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- fiery avenger + mark of atonement
	if(item_lib.check_turn_in(e.trade, {item1 = 29010, item2 = 11050})) then
		e.self:Emote("screams so loudly it echoes across the valley as the mark and flames of your holy sword touch his rotted bones. As his body twists he quiets and then speaks. 'Your selflessness has made it possible to redeem my honor. With the cleansing of my corruption your own soul has been strengthened. Your power comes from your devotion to your god and with this you have been rewarded. Remember always your purity, devotion, and why you have sacrificed. I must go now to sacrifice myself upon the spear of pain.'");
		e.other:SummonItem(10099); --fiery defender
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:fearplane ID:72078 -- Irak_Altil
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
