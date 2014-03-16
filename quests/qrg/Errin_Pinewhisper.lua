function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Surefall Glade friend. I am Errin Pinewhisper, Ranger of Karana the Storm Lord. You will find worshipers of both Karana and Tunare residing here in harmony. I train young rangers of both faiths and assist them in getting prepared for work in the often dangerous lands beyond the glade. If you are in need of a [sturdy outfit] suitable for work as a young ranger then I will gladly instruct you on the means to obtain one.");
	elseif(e.message:findi("sturdy outfit")) then
		e.self:Say("This specially prepared curing kit will allow you to craft an outfit that will protect you in the wilds of Norrath. The materials required for the outfit vary depending on the piece you desire to craft. Do you desire to craft Pine Scout [Gloves], Pine Scout [Boots], a Pine Scout [Bracer], a Pine Scout [Cap], Pine Scout [Leggings], Pine Scout [Sleeves], or a Pine Scout [Tunic]? Once you are properly outfitted there is an [issue] that you may be of assistance in resolving.");
		e.other:SummonItem(17125);
	elseif(e.message:findi("boots")) then
		e.self:Say("To craft Pine Scout Boots you require two [silk thread], ruined gnoll chain boots, two giant field rat whiskers, and a large whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To craft an Pine Scout Bracer you require a [silk thread], a ruined gnoll chain bracer, and a giant field rat whiskers. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558);
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft a Pine Scout Cap you require two [silk thread], a ruined gnoll chain cap, a large whiskered bat fur, and a large field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Coif Pattern.");
		e.other:SummonItem(19555);
	elseif(e.message:findi("gloves")) then
		e.self:Say("To craft Pine Scout Gloves you require two [silk thread], ruined gnoll chain gloves, two giant field rat whiskers, and a large whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559);
	elseif(e.message:findi("leggings")) then
		e.self:Say("To craft Pine Scout Leggings you require three [silk thread], ruined gnoll chain leggings, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		e.other:SummonItem(19560);
	elseif(e.message:findi("sleeves")) then
		e.self:Say("To craft Pine Scout Sleeves you require two [silk thread], ruined gnoll chain sleeves, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557);
	elseif(e.message:findi("tunic")) then
		e.self:Say("To craft a Pine Scout Tunic you require four [silk thread], a ruined gnoll chain tunic, a giant whiskered bat fur, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556);
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk thread is created from two spiderling silks woven together in a sewing kit or loom.");
	elseif(e.message:findi("issue")) then
		e.self:Say("A poacher was recently discovered hunting the bears in Surefall Glade and Qeynos Hills. This poacher has been identified as Yollis Jenkin and it appears that he has fled to Western Plains of Karana to escape retribution by the Jaggedpine Treefolk for his murders. Find Yollis Jenkin and tell him the Jaggedpine Treefolk sent you. He is wanted dead or alive so if he resists capture then bring me his head.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19949})) then
		e.self:Say("It is a shame when human blood must be shed in the defense of our brother wolves and bears. I thank you for your dedication to the Jaggedpine Treefolk. Take this rusty pine scout sword and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done return the sharpened sword to me with a gnoll fang and a large king snake skin and I will put the finishing touches on the weapon.");
		e.other:Ding();
		e.other:Faction(159,30); --jaggedpine treefolk
		e.other:Faction(265,30); --protectors of pine
		e.other:Faction(267,30); --qrg protected animals
		e.other:Faction(347,-30); --unkempt druids
		e.other:Faction(135,30); --guards of qeynos
		e.other:AddEXP(5000);
		e.other:SummonItem(19950);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20104,item2 = 13915, item3 = 19945})) then
		e.self:Emote("fashions a grip from the large king snake skin, attaches the gnoll fang to the heel of the swords hilt, and polishes the blade of the sword with a luminescent green polish.");
		e.self:Say("Here is your new weapon young ranger. May it serve you well.");
		e.other:Ding();
		e.other:Faction(159,30); --jaggedpine treefolk
		e.other:Faction(265,30); --protectors of pine
		e.other:Faction(267,30); --qrg protected animals
		e.other:Faction(347,-30); --unkempt druids
		e.other:Faction(135,30); --guards of qeynos
		e.other:AddEXP(10000);
		e.other:SummonItem(20263);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone: qrg ID:3041 -- Errin_Pinewhisper