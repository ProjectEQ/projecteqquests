--lakerathe/Kimm_McShannel.lua NPCID 51159
--Shaman Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("elder spirit sent me") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Aye, well then. Watch yerself. Thar be a crazy fella over there. Been trying for days, I 'ave, to get 'im to make some sense about this megalodon creature 'e keeps prattling on about. I been a bit shy o' stepping in the lake to get some seaweed for the spirit's potion. Maybe you could go take a look. Somethin' usually comes by to snap 'em up when they grow, so ye may need to route around a tad out there. You think you are [" .. eq.say_link("up to it") .. "]?");
	elseif(e.message:findi("up to it") and qglobals["shaman_epic"] == "1") then
		e.self:Say("Very well, then, off you go in search of the seaweed.");
		eq.spawn2(51160,0,0,2812,-771,-199,146); --Ancient Megalodon
	elseif(e.message:findi("break down") and qglobals["shaman_epic"] == "5") then
		e.self:Say("As most things, the process is not a simple one and we'll need some ingredients for a special potion. You must retrieve four items, which should not prove difficult for a shaman of your stature. They are very specific and I can tell you more about the [" .. eq.say_link("skin") .. "], the [" .. eq.say_link("powder") .. "], the [" .. eq.say_link("tooth") .. "], and the [" .. eq.say_link("goo") .. "]. When you have all of these things, use my medicine bag to create this potion and return it to me.");
		e.other:SummonItem(52922); --Heyokah Medicine Bag
	elseif(e.message:findi("skin") and qglobals["shaman_epic"] == "5") then
		e.self:Say("First, you must find your way to Kuua for part of the potion. There you will find a foul hound of flesh with no fur and fangs. We need a perfect specimen of some of its skin for our potion. Three should do nicely.");
	elseif(e.message:findi("powder") and qglobals["shaman_epic"] == "5") then
		e.self:Say("The powder is very unique and can be difficult to obtain -- many have died trying as it's a coveted magic. There is an undead fiend that uses this powder to turn many creatures and darken them. It is a beast in a sickly plane which makes it that much more challenging, of course. This powder is needed so that we can use a pinch of it to attract the Spirit of Might close enough to us to have it turn its back on the path of the wasichu.");
	elseif(e.message:findi("tooth") and qglobals["shaman_epic"] == "5") then
		e.self:Say("In suffocating lands, there are a few revenants with a marrow that we need. It's a rather unpleasant task and I'm sure they won't cooperate. You must find four of their teeth.");
	elseif(e.message:findi("goo") and qglobals["shaman_epic"] == "5") then
		e.self:Say("The goo is very special and will provide a strong acidic base for the agent we are creating. You will find it deep where the spirits groan and drift, where it seems even the walls howl in agony. There is only one creature that produces this goo that we use to separate gem from metal. It is very deep within that place. You should try to obtain two samples of goo.");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52926})) then --hand in Lustrous Seaweed (looted from Ancient Megalodon)
		e.self:Say("Well done! And ye got it off that great creature? Aye, it really exists. Guess that mad feller ain't so mad, now, is he? Ha! Well, we have a better chance at saving the spirit. Take this seaweed back. I've wrapped it for you. Now, get moving!");
		e.other:SummonItem(57600); --Twine-wrapped Lustrous Seaweed
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57088})) then --hand in Gemmed Bangle of Enlightenment (From Elder Spirit of Enlightenment after previous step)
		e.self:Say("Aye, so ye have returned. We have much to do here, me friend. The first thing we must do is [" .. eq.say_link("break down") .. "] this bangle into its gems and metal. This here bangle was very carefully made. First, the gems were blessed by the spirits, then the metal itself as it was forged. Aye, we need to carefully separate them. The two gems were blessed by the spirits of Wisdom and Patience, and the metal was strengthened by the Spirit of Might. We will use these to call them back to us.");
		eq.set_global("shaman_epic","5",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 57560})) then --hand in Shaman's Precious Diffusing Agent (made from combining various drops for this stage, recipe likely needs added to db)
		e.self:Emote("nods at you and reaches into her pocket and takes out the gemmed bangle and puts it on the ground. She takes the vial and slowly lets a few drops fall on the platinum. It seems to coil and bend and pulls itself into a small globe and the gems lazily fall onto the ground.");
		e.self:Say("Perfect! Now, you must return the gems and platinum to the Spirit of Enlightenment. I've put it in a purse to keep them safe. You truly are beginning to surpass all of our expectations, " .. e.other:GetName() .. ".");
		e.other:SummonItem(57614); --Runed Purse of the McShannels
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	
