--Quests covered in this file:
--Shaman Skull Quest 7
-- items: 30984, 30986, 30988, 5146

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Leave me in peace " .. e.other:GetCleanName() .. ", I have little desire for company now. The Faceless sends visions to me that may hold the fate of our race in sway.");
	elseif(e.message:findi("visions") and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("The spirits tell me of strange happenings around the ancient city of Charasis. None of the mystics that have been sent to investigate have returned. Something is surely happening in the ancient tombs of that city. I pray to our lord for some way to calm the tortured spirits of our fallen brothers that haunt the Howling Stones.");
	elseif(e.message:findi("dreams cloud your mind") and (e.other:GetFaction(e.self) <= 4)) then
		e.self:Say("I see much darkness...darkness and death. A void of life...the cold grip of death. An Ancient pact...with forces too terrible to describe...A great Leader...a fall, and a second coming. I see...a symbol of...an ancient city...Kaesora. I would begin there young Mystic. The spirits of that fallen city may hold a key to our future.");
	end
end

function event_trade(e)
	--local qglobals = eq.get_qglobals(e.other,e.self);
	local item_lib = require("items");
	--Turn in the a dusty iksar skull
	if(e.other:GetFaction(e.self) <= 4 and e.other:HasItem(5146)) then
		if(item_lib.check_turn_in(e.trade, {item1 = 30984}))  then
			e.self:Emote("peers at the skull intently. 'There is strange magic in this skull " .. e.other:GetCleanName() .. ", whatever necromancer animated this skeleton was a powerful warlock indeed. I sense the power of several ancients in this relic. Take this skull to Oracle Qulin in the field of bone, he may be able to perform the ritual which will free this ancient's spirit from the mortal realm.'");
			e.other:QuestReward(e.self,0,0,0,0,30984);	--give back the skull
		end
		--Turn in the note Oracle Qulin gave you
		if(item_lib.check_turn_in(e.trade, {item1 = 30986})) then
			e.self:Say("It is as I feared, the mark of the warlock has surely driven these ancient spirits mad. We can not allow these spirits to roam free in our world " .. e.other:GetCleanName() .. ". Take this case and place the glowing skulls of other ancients inside of it. Return it to me with your Cudgel of the Heirophant so that we may remove these cursed spirits from our world forcefully.");
			e.other:QuestReward(e.self,0,0,0,0,17134);	--give ornate skull case for 4 glowing skulls
		end
		--Turn in full ornate skull case and cudgle of the heirphant
	elseif(item_lib.check_turn_in(e.trade, {item1 = 30988, item2 = 5146})) then
		e.self:Say("You have done well " .. e.other:GetCleanName() .. ". Perhaps you can help clear these troubling dreams from my tired aging mind. Commune with the spirits of our Ancestors and learn from them. Never forget that the ultimate power comes from knowledge. The ancients are privy to much knowledge that mortals will never see. Should you be granted enlightenment from our ancestors, share your knowledge with me so that we may use this knowledge for the benefit of our brethren. I will continue to study the [dreams] that [cloud] my mind.");
		e.other:QuestReward(e.self,0,0,0,0,5148);	--SkyIron Cudgel of the Arisen
	end
	item_lib.return_items(e.self, e.other, e.trade)	--return items if not the ones required
end
