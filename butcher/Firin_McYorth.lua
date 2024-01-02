--Frostfell A Gift for Tinam (#4) -- TODO Update Task ID's

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Yes?");
	elseif e.message:findi("skin") then
        if e.other:IsTaskActive(4) then
            e.self:Say("Oh, I see! That troll must have sent you! She must be jealous of my bear skin cloak! Tell you what, there is something I am jealous of too, if you do me a [favor] and find bring me this thing, I will trade you the cloak.");
        end
    elseif e.message:findi("favor") then
        if e.other:IsTaskActive(4) then
            e.self:Say("I'll trade you my cloak if you can get me a fishing spear from an aqua goblin named Morky. If you can catch him I will trade you the cloak. However, he is a [slippery] devil but I know of a trick to catch him!");
        end
    elseif e.message:findi("slippery") then
        if e.other:IsTaskActive(4) then
            e.self:Say("Take this bag of coins and try giving it to Morky. If he sees it he might be willing to trade the spear for it. If you can catch him!");
            e.other:SummonItem(87574); -- Firin's Bag of Coins 
        end
    end
end

function event_trade(e)
    local item_lib = require("items");
    if e.other:IsTaskActivityActive(4,6) then -- Frostfell A Gift for Tinam (#4) Activity ID 6 active
        if item_lib.check_turn_in(e.trade, {item1 = 87544}) then -- Morky's Spear
			e.self:Say("Well done! You must be quick to catch that little guy! Here take the cloak, as promised.")
			e.other:UpdateTaskActivity(4,6,1); -- Frostfell A Gift for Tinam (#4) Activity ID 6 complete
            e.other:SummonItem(87543); -- Firin's Bear Skin Cloak
		end
    end
    item_lib.return_items(e.self, e.other, e.trade);
end