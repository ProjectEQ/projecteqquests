-- items: 19561, 19558, 19555, 19559, 19560, 19557, 19556, 19846, 19919, 19925, 19850, 19937
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you're a new employee of the Coalition of Tradefolk I suggest you speak with Tovan Tenlah. Now if you will excuse me I have much work to do.");
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Coalition Trader Boots you require two [silk thread], two ruined cat pelts, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		-- Tattered Boot Pattern ID-19561
		e.other:SummonItem(19561); -- Item: Tattered Boot Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To craft an Coalition Trader Bracer you require a [silk thread], a ruined cat pelt, and a desert spiderling hairs. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		-- Tattered Wristband Pattern ID-19558
		e.other:SummonItem(19558); -- Item: Tattered Wristband Pattern
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft a Coalition Trader Cap you require two [silk thread], a ruined cat pelt, a dune spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
		-- Tattered Cap Pattern ID-19555
		e.other:SummonItem(19555); -- Item: Tattered Cap Pattern
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Coalition Trader Gloves you require two [silk thread], a ruined cat pelt, two desert spiderling hairs, and a rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		-- Tattered Glove Pattern ID-19559
		e.other:SummonItem(19559); -- Item: Tattered Glove Pattern
	elseif(e.message:findi("legging")) then
		e.self:Say("To craft Coalition Trader Leggings you require three [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		-- Tattered Pant Pattern ID-19560
		e.other:SummonItem(19560); -- Item: Tattered Pant Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Coalition Trader Sleeves you require two [silk thread], a low quality cat pelt, two dune spiderling hairs, and a large rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		-- Tattered Sleeve Pattern ID-19557
		e.other:SummonItem(19557); -- Item: Tattered Sleeve Pattern
	elseif(e.message:findi("tunic")) then
		e.self:Say("To craft a Coalition Trader Tunic you require four [silk thread], a medium quality cat pelt, a desert tarantula hairs, and a giant rattlesnake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		-- Tattered Tunic Pattern ID-19556
		e.other:SummonItem(19556); -- Item: Tattered Tunic Pattern
	elseif(e.message:findi("silk thread")) then
		e.self:Say("I'm sure you could find a tailor in town to make you some silk thread or you can make your own with 2 Spiderling Silk.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19846 })) then -- Note to Verona Rankin
		e.self:Say("Ah, Tovan sent you for a suit of traders clothing. I can instruct you on how to prepare your suit of clothing but you will have to acquire the required materials yourself. Use this Curing Kit to construct the clothing once you have done so. Do you wish to prepare Coalition Trader [Gloves], Coalition Trader [Boots], a Coalition Trader [Bracer], a Coalition Trader [Cap], Coalition Trader [Leggings], Coalition Trader [Sleeves], or a Coalition Trader [Tunic]?");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19919,item2 = 19925,item3 = 19850})) then
		e.self:Say("You have proven yourself worthy of our cause. Take this and use it to bring down non followers of Innoruuk.");
		e.other:SummonItem(19937); --Coalition Trader Dirk
		e.other:Ding();
		e.other:Faction(5015,1,0); -- Coalition of TradeFolk III
		e.other:Faction(229,1,0); -- Coalition of Trade Folk
		e.other:Faction(329,1,0); -- Carson McCabe
		e.other:Faction(230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,1,0); -- Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:freporte  ID:10129 --  Verona_Rankin
