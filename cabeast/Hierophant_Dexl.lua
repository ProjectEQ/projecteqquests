--Shaman Skull Quest 6
-- items: 5145, 12748, 12750, 12749

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("seems to be preocupied. He is examining an egg. 'What?!! Who has [sent] you to me? Bah!! Away with you.' He ignores you and continues chanting.'");
	elseif(e.message:findi("sent")) then
		e.self:Emote("drops the egg he was holding. Egg yolk splatters on your foot. His eyes roll back into his head. He speaks, but his voice is that of a female. 'I await you, " .. e.other:GetCleanName() .. " . My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.'");
	elseif(e.message:findi("Zand") and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("I await you, " .. e.other:GetCleanName() .. " . My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.");
	elseif(e.message:findi("Sisters") and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Emote(" wipes egg yolk from his clothing. 'My, what a mess!! Hmmph!! What did you say? Sisters of Scale? They were a legendary trio of mystics. We once had their skulls sealed within this temple, but now they are lost. I sent a channeler to retrieve them. His name was Vagnar. I am sure he shall find them.'");
	elseif(e.message:findi("vagnar") and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("'He's a capable channeler, I trust he knows where to look and will prepare himself. Any competent servant of our Lord would prepare potions and supplies before going on such a quest. If he doesn't come back, it's no great loss, he wasn't Hierophant material anyway.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the skulls of the sisters of scale and your cudgel of the channeler
	if(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.trade, {item1 = 5145, item2 = 12748, item3 = 12750, item4 = 12749})) then
		e.self:Say("You have returned the skulls of the Sisters of Scale. For this you shall be rewarded. Take this hierophant's weapon. May you use it to smite the foes of our people.' Dexl comes out of the trance. 'What?!! Whew. Hey!! Where is my cudgel?");
		e.other:Faction(445, 10); 					--Scaled Mystics
		e.other:Faction(441, 10); 					--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,10,5146,140000); 	--Give the player The Cudgel of the Hierophant
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
