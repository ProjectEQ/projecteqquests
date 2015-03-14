-- Bregna's Big Mistake
-- Aid Garuuk
-- Converted to .lua by Speedz
-- added saylink by robregen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me says hi to you. What you want from me? Oh!! Me shaman trainer. You must be shaman. Are you [" .. eq.say_link("shaman Darkone",false,"shaman Darkone") .. "]?");
	elseif(e.message:findi("shaman darkone")) then
		e.self:Say("You choose rite if you bes a shaman. We's da best. You remember ta not get in Kaglari way. She get mad berry easy. She gets berry mad at Bregna if she finds out me make [" .. eq.say_link("big mistake",false,"big mistake") .. "].");
	elseif(e.message:findi("big mistake")) then
		e.self:Say("Kaglari make me do the tasks for her. She tolds me to take crate of speshal poshuns to sumwun in Nektoolos forust. But I make mistake. I fall asleep under da trees becuz I was so tired. I wake up and poshuns are gone! Sumwun take the poshuns frum me. Dey leave dis note wit me. Me tinks dey play trick on me. Me tinks it be da stinkin' Halflings. Me needs ta gets dem back before Kaglari find out. I need sumwun to help me [" .. eq.say_link("find da poshuns",false,"find da poshuns") .. "].");
	elseif(e.message:findi("find da poshuns")) then
		e.self:Say("Take dis as it be all me know.");
		e.other:Ding();
		e.other:SummonItem(18651);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13984})) then -- Bregna's Big Mistake
		e.self:Say("Now Kaglari won't be mad at Bregna.");
		e.other:SummonItem(12212);
		e.other:Ding();
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 26632, item2 = 26640, item3 = 29921, item4 = 26662})) then -- Aid Garuuk
		e.self:Say("Ere. take dis back to Garuuk, K.");
		e.other:SummonItem(28740);
		e.other:Ding();
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
