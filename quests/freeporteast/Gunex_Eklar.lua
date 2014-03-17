function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Begone lest you seek instruction. I am very busy. I teach those who [follow the path of rage] as a Shadowknight. the leaders of the Dismal Rage.");
	elseif(e.message:findi("follow the path of rage")) then
		e.self:Say("As the leaders of the Dismal Rage we Shadowknights forefront of our struggles. We use the spiritual guidance of our Clerics. the Dark Arts of our Necromancers. and the tactics of our Warriors to advance the causes and secure the needs of our followers. If you aspire to be of importance to your colleagues you must first obtain a suit of armor to defend you from the aggressions of our enemies. Take this note to Quan Nektogo here in the eastern quarter of Freeport. He will aid you in the construction of your armor. When you are properly outfitted return to me and I will present you with an [important task].");
		e.other:SummonItem(19845); -- Note to Quan Nektogo
	elseif(e.message:findi("important task")) then
		e.self:Say("It has come to our attention that a paladin of the Sentries of Passion. Raenna Griff. has been aiding sympathizers and wanted members of the Sentries of Passion and the Knights of Truth in the sewer tunnels beneath the western quarter of Freeport. The incompetent Freeport Militia has yet to capture these wanted followers of the Mar twins. We will wait for their capture no longer. Seek this Raenna Griff individual and slay her. I want her head presented to me this very night!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19934})) then -- Raenna Griff's Head
		e.self:Say("It took you long enough. I wonder if the Militia will be able to identify the body minus its head. Take this Dull Dismal Long Sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is accomplished deliver the Sharpened Dismal Long Sword and a Giant Rattlesnake Skin to Quan Nektogo. He will make the final preparations on your weapon.");
		e.other:SummonItem(19923); --Dull Dismal Longsword
		e.other:Ding();
		e.other:Faction(86,1,0); --Dismal Rage
		e.other:Faction(235,1,0); --Opal Dark Briar
		e.other:Faction(184,-1,0); --Knights of Truth
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10099 -- Gunex_Eklar