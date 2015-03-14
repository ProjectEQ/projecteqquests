function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am busy right now. Please leave me alone."); --Text made up
	elseif(e.message:findi("thorn mail coif")) then
		e.self:Say("To assemble a Thorn Mail Coif you will require two [silk thread], ruined thorn drakeling scales, and a giant thicket rat skull. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Coif Pattern.");
		e.other:SummonItem(19555,1);
	elseif(e.message:findi("thorn mail bracer")) then
		e.self:Say("To assemble a Thorn Mail Bracer you will require a [silk thread], ruined thorn drakeling scales, and a large fruit bat wing. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Bracer Pattern.");
		e.other:SummonItem(19558,1);
	elseif(e.message:findi("thorn mail gloves")) then
		e.self:Say("To assemble Thorn Mail Gloves you will require two [silk thread], ruined thorn drakeling scales, and two large fruit bat furs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559,1);
	elseif(e.message:findi("thorn mail boots")) then
		e.self:Say("To assemble Thorn Mail Boots you will require two [silk thread], two ruined thorn drakeling scales, and two giant thicket rat pelts. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561,1);
	elseif(e.message:findi("thorn mail sleeves")) then
		e.self:Say("To assemble Thorn Mail Sleeves you will require two [silk thread], thorn drakeling scales, and two giant fruit bat wings. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557,1);
	elseif(e.message:findi("thorn mail leggings")) then
		e.self:Say("To assemble Thorn Mail Leggings you will require three [silk thread], two thorn drakeling scales. and two giant fruit bat furs. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
		e.other:SummonItem(19560,1);
	elseif(e.message:findi("thorn mail tunic")) then
		e.self:Say("To assemble a Thorn Mail Tunic you will require four [silk thread], pristine thorn drakeling scales, a giant fruit bat rib cage, and a giant fruit bat fur. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556,1);
	elseif(e.message:findi("silk thread")) then
		e.self:Say("To make silk thread, take 2 spiderling silks and combine them together in a loom or in your handy sewing kit."); --Text made up
	end
end

function event_trade(e)
local item_lib = require("items");

	if (item_lib.check_turn_in(e.trade,  {item1 = 19627})) then
		e.self:Say(string.format("Pleased to meet you %s! You must be one of Megosh's new trainees. Megosh has asked me to help get you outfitted in a suit of armor to protect you from the vile weapons of Rivervales foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Thorn Mail armor you are planning on assembling. Do you wish to craft a [thorn mail coif], a [thorn mail bracer], [thorn mail gloves], [thorn mail boots], [thorn mail sleeves], [thorn mail leggings], or a [thorn mail tunic].", e.other:GetCleanName()));
		e.other:SummonItem(17124);
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end
--END of FILE Zone:rivervale  ID:19046 -- Bipdo_Hargin