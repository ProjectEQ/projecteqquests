-- items: 17976, 12281, 5376
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings, my friend. What brings you so far from the trodden path? I hope you do not plan on stealing my [fishing spot].");
	elseif(e.message:findi("fishing spot")) then
		e.self:Say("I need this spot!! I fish to feed my growling tummy. I can no longer [venture into Kaladim] and eat in its fine taverns.");
	elseif(e.message:findi("venture into kaladim")) then
		e.self:Say("I have been disgraced!! I used to be a respected paladin of the Church of Underfoot until I failed to complete a very [important task] for Lord Datur Nightseer. He stripped me of my Cape of Underfoot. I cannot walk the halls of Kaladim without my cape.");
	elseif(e.message:findi("important task")) then
		e.self:Say("I was ordered by Lord Nightseer to carry the [Chalice of Conquest] to a noble band of paladins in the mountains of Rathe. While there, the entire camp was overtaken by a band of orcs. During the battle there was a [strange occurrence].");
	elseif(e.message:findi("chalice of conquest")) then
		e.self:Say("The Chalice of Conquest is said to have been delivered to the Church of Underfoot by Brell himself. It is said that whoever drinks from the chalice is assured victory in battle. It is also said that only good-natured creatures may safely drink from it and only a comatose state is assured to any evil creature who dares to sip from it.");
	elseif(e.message:findi("strange occurrence")) then
		e.self:Say("A large fray raged. Brave, valiant paladins fought vile, green-skinned orcs and while this happened, I spied the [Chalice of Conquest] being taken away from the camp. I was then distracted by a well placed orcish blade. After I defeated the orcs in my way, I turned to see a blue orc running toward the horizon. I gave chase to no avail. I lost the chalice and all respect. If only a [noble Paladin of Underfoot] would assist me...");
	elseif(e.message:findi("candle of bravery")) then
		e.self:Say("The Candle of Bravery is ceremonial and is lit when one sips from the [Chalice of Conquest]. The candlestick was left with a fellow Paladin of Underfoot in the Rathe Mountains. The candle itself was lost and I do not know where Priestess Ghalea purchases them.");
	elseif(e.message:findi("noble paladin of underfoot")) then
		if(fac > 4) then
			e.self:Say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
		else
			e.self:Say("Yes, you shall do, noble " .. e.other:GetName() .. ". Take this. This is the Chalice Case. It is intended for the Chalice of Conquest and the [Candle of Bravery]. If you should get both, be sure to place them within the Chalice Case and combine them. Take the full Chalice Case to Lord Nightseer in Kaladim and I shall be redeemed and you shall surely earn a fine paladin's reward. Let your quest begin in the mountains of Rathe.");
			e.other:SummonItem(17976); -- Item: Chalice Case - empty
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12281})) then -- Item: Cape of Underfoot
		e.self:Say("I thank you, my friend. You are truly a great paladin and noble addition to our ranks. I now can walk in Kaladim. Take this as a reward. It is the Holy Partisan of Underfoot. It is now yours. I believe it still has a couple of charges. Use it wisely as the only cleric able to recharge it was lost amid the lava filled lands of Antonica.");
		e.other:Ding();
		e.other:Faction(297, 10); -- Faction: Paladins of Underfoot
		e.other:Faction(274, 7); -- Faction: Kazon Stormhammer
		e.other:Faction(227, 10); -- Faction: Clerics of Underfoot
		e.other:Faction(216, 1); -- Faction: Veeshan
		e.other:AddEXP(750);
		e.other:SummonItem(5376, 5); -- Item: Holy Partisan of Underfoot
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
