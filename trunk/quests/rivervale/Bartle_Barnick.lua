function event_say(e)
	if(e.message:findi("moss toe cap")) then
		e.self:Say("To assemble a Moss Toe Cap you will require two [silk thread], a ruined mossy rat pelt, and a giant thicket rat skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		-- Summon: Tattered Cap Pattern
		e.other:SummonItem(19555);
	elseif(e.message:findi("moss toe bracer")) then
		e.self:Say("To assemble a Moss Toe Bracer you will require a [silk thread], a ruined mossy rat pelt, and a large wood spider tibia. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
		-- Summon: Tattered Wristband Pattern
		e.other:SummonItem(19558);
	elseif(e.message:findi("moss toe gloves")) then
		e.self:Say("To assemble Moss Toe Gloves you will require two [silk thread], a ruined mossy rat pelt, and two large wood spider tarsus. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		-- Summon: Tattered Glove Pattern
		e.other:SummonItem(19559); 
	elseif(e.message:findi("moss toe boots")) then
		e.self:Say("To assemble Moss Toe Boots you will require two [silk thread], two ruined mossy rat pelts, and two giant wood spider hairs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		-- Summon: Tattered Boot Pattern
		e.other:SummonItem(19561); 
	elseif(e.message:findi("moss toe sleeves")) then
		e.self:Say("To assemble Moss Toe Sleeves you will require two [silk thread], a mossy rat pelt, and two giant wood spider patella. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		-- Summon: Tattered Sleeves Pattern
		e.other:SummonItem(19557);
	elseif(e.message:findi("moss toe leggings")) then
		e.self:Say("To assemble Moss Toe Leggings you will require three [silk thread], two mossy rat pelts, and two giant wood spider femurs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Pants Pattern.");
		-- Summon: Tattered Pants Pattern
		e.other:SummonItem(19560);
	elseif(e.message:findi("moss toe tunic")) then
		e.self:Say("To assemble a Moss Toe Tunic you will require four [silk thread], an undamaged mossy rat pelt, and a giant wood spider thorax. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		-- Summon: Tattered Tunic Pattern
		e.other:SummonItem(19556);
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk Thread is sewn by a tailor using a [sewing kit] or a community [loom]. Two spiderling silks combined in the sewing kit or loom will create one silk thread.");
	elseif(e.message:findi("sewing kit")) then
		e.self:Say("Meeka Diggs in the center of Rivervale behind the Fools Gold Tavern may be able to provide you with a sewing kit. There is also a loom near where she peddles her goods.");
	elseif(e.message:findi("loom")) then
		e.self:Say("Meeka Diggs in the center of Rivervale behind the Fools Gold Tavern may be able to provide you with a sewing kit. There is also a loom near where she peddles her goods.");
	end
end
 


function event_trade(e)
	local item_lib = require("items");

	-- Handin: Letter to Bartle Barnick
	if(item_lib.check_turn_in(e.trade,  {item1 = 19629})) then
		e.self:Say("It is good to see another of our young people choose the humble life of a druid of Karana. I have assembled patterns that will allow you to construct some protective leather garments to keep you comfortable in the wilds and help turn aside the weapons of the Storm Reapers enemies. The required components for the leather vary according to which piece of Moss Toe Leather your are planning on crafting. Do you wish to craft a [moss toe cap], a [moss toe bracer], [moss toe gloves], [moss toe boots], [moss toe sleeves], [moss toe leggings], or a [moss toe tunic]?");
		e.other:SummonItem(17124); --Mail Assembly Kit
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--EOF
