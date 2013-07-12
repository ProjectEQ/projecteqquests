function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Romar Sunto, servant of Solusek Ro. I am searching for the [Coin] of the mighty enchanter [Tash] - if you are interested in helping me acquire it, I will [reward] you with a powerful spell. I am also dispenser of [Darkwood Staves] - sometimes also called the Staff of Ro.");
	elseif(e.message:findi("darkwood staves")) then
		e.self:Say("Bring me a Lambent Stone from a Hill Gant, a Sand Giant or a Griffon and I will give you a Darkwood Staff.");
	elseif(e.message:findi("tash")) then
		e.self:Say("Tash was a mighty enchanter and a master jewelcrafter.");
	elseif(e.message:findi("reward")) then
		e.self:Say("'I will reward you with a scroll for the spell Tashania. For personal use, of course.");
	elseif(e.message:findi("coin pouch")) then
		e.self:Say("I will gladly lend you this coin pouch - put all 10 antique silver coins into it and combine them into the Coin of Tash.");
		e.other:SummonItem(17511); -- A coin pouch - to combine the coins in
	elseif(e.message:findi("coin")) then
		e.self:Say("Tash had a collection of ten antique silver coins that were left in different cities around the world. If you were to collect all 10 coins, I would give you a [coin pouch] that would let you combine them into the master Coin of Tash. If you are interested I will sell you a copy of the Tome of Tash, detailing where the coins were reportedly left, for a mere 50 gold.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10000})) then
		e.self:Say("A stone for a staff - very well.");
		e.other:SummonItem(6048); -- Darkwood Staff
		e.other:Ding();
		e.other:Faction(320,15,0);
		e.other:Faction(291,-15,0);
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10793})) then -- Radiant Coin of Tash
		e.self:Say("The Coin of Tash - fully enchanted! I am in your debt. Here is the scroll of Tashania that was promised to you.");
		e.other:SummonItem(15678); -- Spell: Tashania
		e.other:Ding();
		e.other:Faction(442,15,0);
		e.other:Faction(291,-15,0);
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10790})) then -- Coin of Tash
		e.self:Say("The Coin of Tash. It is of no use to me like this. You must take the coin to Tarn Visilin in High Keep to get it enchanted.");
		e.other:SummonItem(10790); -- Coin of Tash
	elseif(item_lib.check_turn_in(e.trade, {gold = 50})) then -- 50 gold
		e.other:SummonItem(18032); -- Tome of Tesh
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
