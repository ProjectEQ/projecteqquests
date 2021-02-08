-- Converted to .lua by Speedz
-- items: 17125, 19561, 19555, 19559, 19560, 19556, 19557, 19558, 10994, 11081

function event_say(e)
	if(e.message:findi("silk thread")) then
		e.self:Say("To create silk thread, combine 2 spiderling silk inside a tailoring kit.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. ". I am Tilkzog Mournunder, Necromancer of the Dark Reflection. It is my duty here to assist not only the young necromancers of the Dark Reflection but also those wizards, magicians, and enchanters that have been called into the service of the Plague Bringer. I will aid you in obtaining an outfit of [durable clothing] suitable for a young sorcerer of the Dark Reflection. Once you have been adequately outfitted for venturing beyond our homeland in service of the Plague Bringer return to me and I will assist you in obtaining a [staff of dark reflections].");
	elseif(e.message:findi("staff of dark reflections")) then
		e.self:Say("The Dark Reflection has many enemies even within our home of Ak'Anon and the surrounding Steamfont Mountains. Many fear and oppose the beliefs that grant us our vision and powers. A wizard of the Eldrich Collective by the name of Winex Kloktik has been aiding members of the Deep Muses hunt and slay those loyal to Bertoxxulous and the Dark Reflection. Seek Winex Kloktik and eliminate her. When you have completed this task bring me Winex's Staff.");
	elseif(e.message:findi("durable clothing")) then
		e.self:Say("The sorcerous servants of Bertoxxulous, the Plague Bringer, are privileged with the sight of the Dark Reflection. This gift enlightens us to the powers of disease, decay, death, and destruction. Forces that are misunderstood and feared by the majority of Norrath, including our fellow gnomes of Ak'Anon. These forces are the catalyst of change, cleansing Norrath of the old and weak, and we are the agents of this catalyst. However, before you will be of much use to the Dark Reflection you must gather the [components] necessary for the outfit that will protect and aid you in your duties.");
	elseif(e.message:findi("component")) then
		e.self:Say("You will need this Curing Kit and varying components depending on the piece of clothing you wish to fabricate. Do you desire to craft a [plague sorcerer cap], [plague sorcerer wristband], [plague sorcerer gloves], [plague sorcerer boots], [plague sorcerer sleeves], [plague sorcerer pantaloons], or [plague sorcerer robe]?");
		e.other:SummonItem(17125); -- Item: Curing Kit
	elseif(e.message:findi("plague sorcerer boot")) then
		e.self:Say("To craft Plague Sorcerer Boots you require two [silk thread], two ebon drakeling bile, and two large rat pelts. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561); -- Item: Tattered Boot Pattern
	elseif(e.message:findi("plague sorcerer cap")) then
		e.self:Say("To craft a Plague Sorcerer Cap you will require two [silk thread], ebon drakeling bile, and a grikbar kobold scalp. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		e.other:SummonItem(19555); -- Item: Tattered Cap Pattern
	elseif(e.message:findi("plague sorcerer glove")) then
		e.self:Say("To craft Plague Sorcerer Gloves you require two [silk thread], ebon drakeling bile, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559); -- Item: Tattered Glove Pattern
	elseif(e.message:findi("plague sorcerer pantaloon")) then
		e.self:Say("To craft Plague Sorcerer Pantaloons you require two [silk thread], young ebon drake bile, and four yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		e.other:SummonItem(19560); -- Item: Tattered Pant Pattern
	elseif(e.message:findi("plague sorcerer robe")) then
		e.self:Say("To craft a Plague Sorcerer Robe you will require three [silk thread], ebon drake bile, a giant rat pelt, and two yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556); -- Item: Tattered Tunic Pattern
	elseif(e.message:findi("plague sorcerer sleeve")) then
		e.self:Say("To craft Plague Sorcerer Sleeves you require two [silk thread], young ebon drake bile, and three yellow recluse silks. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557); -- Item: Tattered Sleeve Pattern
	elseif(e.message:findi("plague sorcerer wristband")) then
		e.self:Say("To craft a Plague Sorcerer Wristband you require a [silk thread], ebon drakeling bile, and a large rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558); -- Item: Tattered Wristband Pattern
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10994})) then
		e.self:Say("You have done well to bring Winex's staff to me, " .. e.other:GetName() .. ". Here is your reward for dealing with that meddlesome fool.");
		e.other:SummonItem(11081); -- Item: Staff of Dark Reflections
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
