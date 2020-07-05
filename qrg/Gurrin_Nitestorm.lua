-- items: 8908, 8911, 8915
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler. I am Gurrin Nitestorm, priest of The Rainkeeper and blacksmith of the Jaggedpine. I am still somewhat lost in these foreign lands and although my excitement to be reunited with our kin and brethren of the Jaggedpine Tree Folk is very much alive, I cannot help but long for my home. Aaaah, but [duty] calls and I must do what I can to aid both forces that equally strive to keep the sacred lands safe from harm and corruption.");
	elseif(e.message:findi("duty")) then
		e.self:Say("Beyond my sacred duties as a priest of The Rainkeeper and a warder of nature, my artisan skill as a blacksmith has been found to be of great use in these fledgling days of our reunion. The residents of the glade and the Knights of Thunder have found my skills to be of great use, and furthermore, I have had the distinct pleasure of learning the blessed ways of the Rainkeeper's faithful of the Qeynos region. Truly, it has been a remarkable experience and consider myself blessed to have this opportunity to be among my kin. My only regret is that the circumstances under which we have been spurned into this reunification of our culture are not ones of joyous regard -- for the dark shadow of corruption will always find a way to seep through even the strongest of iron [barricades].");
	elseif(e.message:findi("barricade")) then
		e.self:Say("In the time when Antonious III guided Qeynos politically and morally, he saw the coming of the dawn of turmoil and sought to preserve all he could of his kingdom and people from the inevitable darkness to enshroud Norrath. The residents of the glade and Jaggedpine alike pleaded to his majesty, asking that the sacred lands of The Rainkeeper's faithful be among the lands spared exposure to the coming shadow of corruption. Knowing the plea of the Jaggedpine Tree Folk to seal themselves indefinitely from their beloved and sacred homeland was not one made lightly or without grievous consideration, his late majesty obliged his subjects' request and a barricade of stone, iron, and magic was constructed on either end of the forest's boundaries.");
	elseif(e.message:findi("guide")) then
		e.self:Say("Indeed, my friend. It seems that Kaithys has chosen you to do so and I shall do what I can to abide by his wishes. I would advise that you return to Kaithys and show him the purified blade. He knows much better than I what stones must now be overturned for his intentions of you to be properly fulfilled.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 8908,item2 = 8911})) then -- Writ of Thunder and Silver Blade of Rot
		e.self:Emote("examines the blade carefully, his manner seeming distant -- as if he were in a trance. The druid then turns to the ancient scroll and slowly begins to read the ancient druidic runes; his voice a soft chant and the rhythm of his incantation slow and powerful. As Gurrin weaves his spell the blade in his hands begins to bleed from the red gem in the hilt, which drains its color as the corruption is purged from its very nature. By the end of the druid's spell the gem in the blade is pure and white and the blade itself seems to have been altered -- sentient and purged of all evil. Gurrin extends the blade to Malvesti, 'The corruption is no more, although the essence of the blade has been returned to the powers that forged it. The Deathrot Knight will exist again and that I cannot change. However, the blade has been set upon a new path and all it needs now is a proper hand and will to [guide] it.'");
		e.other:SummonItem(8915); -- Purified Silver Blade
		e.other:Ding();
		e.other:Faction(1597,20,0);  -- Residents of Jaggedpine
		e.other:Faction(272,20,0);  -- Jaggedpine Treefolk
		e.other:Faction(302,20,0);  -- Protectors of Pine
		e.other:Faction(262,20,0);  -- Guards of Qeynos
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
