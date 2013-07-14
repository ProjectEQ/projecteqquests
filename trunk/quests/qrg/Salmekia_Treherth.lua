function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome to Surefall Glade, %s, the home of the Jaggedpine Treefolk. I help teach young druids the ways of our people. We have worshipers of both Karana, the Storm Lord, and Tunare, the All Mother, living here in the glade. If you are a new druid I will help you obtain a [suit of clothing] that will offer comfort and protection while working in the wilds and help protect you from the weapons of the Gnolls that wish to take these lands.",e.other:GetName()));
	elseif(e.message:findi("suit of clothing")) then
		e.self:Say("You must use this specially prepared Curing Kit to craft the clothing. Each article of clothing requires different materials for its construction. Do you plan on crafting Pine Druid [Gloves], Pine Druid [Boots], a Pine Druid [Bracer], a Pine Druid [Cap], Pine Druid [Leggings], Pine Druid [Sleeves], or a Pine Druid [Tunic]? When you have been outfitted and are ready I will tell you of a [task] that you can assist with.");
		e.other:SummonItem(17125);
	elseif(e.message:findi("glove")) then
		e.self:Say("To craft Pine Druid Gloves you require two [silk thread], ruined gnoll leather gloves, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
		e.other:SummonItem(19559);
	elseif(e.message:findi("boot")) then
		e.self:Say("To craft Pine Druid Boots you require two [silk thread], ruined gnoll leather boots, two giant field rat whiskers, and a large whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
		e.other:SummonItem(19561);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To craft an Pine Druid Bracer you require a [silk thread], a ruined gnoll leather bracer, and a giant field rat whiskers. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
		e.other:SummonItem(19558);
	elseif(e.message:findi("cap")) then
		e.self:Say("To craft a Pine Druid Cap you require two [silk thread], a ruined gnoll leather cap, a large whiskered bat fur, and a large field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
		e.other:SummonItem(19555);
	elseif(e.message:findi("legging")) then
		e.self:Say("To craft Pine Druid Leggings you require three [silk thread], ruined gnoll leather leggings, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Pant Pattern.");
		e.other:SummonItem(19560);
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To craft Pine Druid Sleeves you require two [silk thread], ruined gnoll leather sleeves, two large whiskered bat furs, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
		e.other:SummonItem(19557);
	elseif(e.message:findi("tunic")) then
		e.self:Say("To craft a Pine Druid Tunic you require four [silk thread], a ruined gnoll leather tunic, a giant whiskered bat fur, and a giant field rat pelt. Once you have the necessary components combine them in your Curing Kit with this Tattered Tunic Pattern.");
		e.other:SummonItem(19556);
	elseif(e.message:findi("silk thread")) then
		e.self:Say("Silk thread is created from two spiderling silks woven together in a sewing kit or loom.");
	elseif(e.message:findi("task")) then
		e.self:Say("We druids seek to live in harmony with nature, taking only what we need from the land and the creatures that inhabit it. Although the City of Qeynos is a noble place, there are people in the city that do not share our reverence for nature and poach the animals of the Karanas needlessly. Even worse than these poachers, whom the rangers of the Jaggedpine Treefolk constantly seek to deter, are the despicable worshipers of Bertoxxulous that hide in the sewers and catacombs of Qeynos. These wicked individuals are known as the [Bloodsabers].");
	elseif(e.message:findi("bloodsabers")) then
		e.self:Say("The Bloodsabers are responsible for a number of atrocities including the spreading of the diseases which have been inflicting the wolves and bears of the Qeynos Hills and the recent poisoning of the farmers fields in the Plains of Karana. Recently we have discovered that a Bloodsaber defiler has been attempting to poison the waters of Surefall Glade. Find this individual and deal with him accordingly, I doubt that this individual will surrender willingly. If need be eliminate them and bring me their head.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20268})) then
		e.self:Say("It is a shame that some people decide to throw away their humanity with the worship of evil deities. Your actions have saved the lives of many creatures that rely on the waters of this glade. Take this Rusty Pine Druid Scimitar and sharpen it in a forge with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done return to me with the Sharpened Pine Druid Scimitar, a Gnoll Fang, and a Large King Snake Skin.");
		e.other:SummonItem(20258);
		e.other:Ding();
		e.other:Faction(159,30,0); --
		e.other:Faction(265,30,0); --
		e.other:Faction(267,30,0); --
		e.other:Faction(135,30,0); --
		e.other:Faction(347,-30,0); --
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20259,item2 = 13915,item3 = 19945})) then
		e.other:SummonItem(20265);
		e.other:Ding();
		e.other:Faction(159,30,0); --
		e.other:Faction(265,30,0); --
		e.other:Faction(267,30,0); --
		e.other:Faction(135,30,0); --
		e.other:Faction(347,-30,0); --
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
