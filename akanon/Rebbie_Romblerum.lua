-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. "!");
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk Thread is created by combineing two spiderling silk in a sewing kit."); -- text is made up as i could not find the real text reply.
	elseif(e.message:findi("plague rust boot")) then
		e.self:Say("To assemble Plague Rust Boots you will require two [silk thread], two ruined ebon drakeling scales, and two rebel clockwork foot plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561);
		e.other:Ding();
	elseif(e.message:findi("plague rust bracer")) then
		e.self:Say("To assemble a Plague Rust Bracer you will require a [silk thread], ruined ebon drakeling scales, and a rebel clockwork wrist section. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558);
		e.other:Ding();
	elseif(e.message:findi("plague rust glove")) then
		e.self:Say("To assemble Plague Rust Gloves you will require two [silk thread], ruined ebon drakeling scales, and two rebel clockwork hand plates. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559);
		e.other:Ding();
	elseif(e.message:findi("plague rust legging")) then
		e.self:Say("To assemble Plague Rust Leggings you will require three [silk thread], two ebon drakeling scales, and two rebel clockwork leg sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Leggings Pattern.");
		e.other:SummonItem(19560);
		e.other:Ding();
	elseif(e.message:findi("plague rust sleeve")) then
		e.self:Say("To assemble Plague Rust Sleeves you will require two [silk thread], ebon drakeling scales, and two rebel clockwork arm sections. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557);
		e.other:Ding();
	elseif (e.message:findi("plague rust tunic")) then
		e.self:Say("To assemble a Plague Rust Tunic you will require four [silk thread], pristine ebon drakeling scales, a giant rat pelt, and a rebel clockwork chest plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556);
		e.other:Ding();
	elseif(e.message:findi("plague rust coif")) then
		e.self:Say("To assemble a Plague Rust Coif you will require two [silk thread], ruined ebon drakeling scales, and a rebel clockwork head plate. Once you have the necessary components combine them in your Mail Assembly Kit with this Tattered Cap Pattern.");
		e.other:SummonItem(19555);
		e.other:Ding();
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10988})) then
		e.self:Say("Hail " .. e.other:GetName() .. "! You must be one of Kaxon's new trainees. Kaxon has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Rust Mail you are planning on assembling. Do you wish to craft, a [plague rust bracer], [plague rust gloves], [plague rust boots], [plague rust sleeves], [plague rust leggings], or a [plague rust tunic].");
		e.other:SummonItem(17124);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
