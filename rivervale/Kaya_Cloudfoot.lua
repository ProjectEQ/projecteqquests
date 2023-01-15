-- items: 69970, 19628, 51121, 51122, 18431, 13541, 19688, 19625
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18431)) then
		e.other:Message(15,"A tiny voice calls your name. 'Welcome " .. e.other:GetName() .. ". I knew you would make it. I am Kaya Cloudfoot, Guild Master for the Paladins of the Storm Reapers. Read the note in your inventory and hand it to me when you are ready to begin your training. May the Rainlord bless you on your new path in life.'");
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Hello there noble Paladin. We have been expecting you. Word has been traveling fast about the great deed you are doing to help Kemik out. You seek the final gem to that set of prayer beads you're making?");
		elseif(e.message:findi("yes")) then
			e.self:Say("We halflings don't come across special gems every day ya know. A few seasons ago we happened to be preparing this huge feast for the mayor when a strange [" .. eq.say_link("visitor") .. "] happened to pass through the vale.");
		elseif(e.message:findi("visitor")) then
			e.self:Say("He didn't stay long. Just long enough to have a bite and some drink and he continued his journey. Before he left he left a gem for the vale. None of us were expecting anything in return. We held onto it because we knew there was something [" .. eq.say_link("different about it") .. "].");
		elseif(e.message:findi("different about it")) then
			e.self:Say("I think your eyes should see for themselves. Take this note over to Cheel. He will give you the precious gem of ours. Good luck with your journey " .. e.other:GetName() .. ".");
			e.other:SummonItem(69970); -- Item: Note from Kaya
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("A pleasure to make your acquaintance " .. e.other:GetName() .. ". I am Kaya Cloudfoot. first Paladin of the Storm Reapers. I traveled long ago when I was just a wee sprout to the city of Qeynos far to the west. It was there I grew under the tutelage of the Knights of Thunder. a noble order of paladins loyal to Karana. the Storm Lord. I have returned now to Rivervale to teach interested young halflings the ways of a Knight of the Storm Reapers so that we may defend Karanas people and lands from the [evil forces] that would see it destroyed.");
		elseif(e.message:findi("evil forces")) then
			e.self:Say("There are many problems and creatures that trouble Karanas people through out Norrath and threaten our otherwise peaceful ways of life. Our common folk here in Rivervale are troubled by the wicked Teir`Dal. the Death Fist Orcs. and the Goblins of Clan Runnyeye and Pickclaw. It is the calling and duty of a Knight of the Storm Reapers to defend the common folk from these enemies of Rivervale. Are you willing to [defend the commoners]?");
		elseif(e.message:findi("commoners")) then
			e.self:Say("You have made an honorable decision. " .. e.other:GetName() .. ". First you will need to be outfitted in a suit of armor to protect you from the weapons of our foes. Seek Jimji Bottletoe here in Rivervale and give him this letter. Jimji will instruct you further on acquiring a suit of armor worthy of a new Knight of the Storm Reapers. When you have been outfitted in your Bravefoot Armor return to me and I shall prepare you for your [next task].");
			e.other:SummonItem(19628); -- Item: Letter to Jimji Bottletoe
		elseif(e.message:findi("next task")) then
			e.self:Say("The Teir'Dal. or Dark Elves that reside in the underground city of Neriak to the east beyond the Commonlands have long been a bane to us Storm Reapers. Many of our Druids have fallen attempting to hold back the tide of hate and destruction that has taken hold on the Nektulos Forest and threatens the surrounding lands. It was also the Teir`Dals patron God. Innorruuk. who caused the [Curse of Bloody Kithicor]. Are you ready to [face the Teir'Dal] and bloody your hands for the protection of your Shire and our commoners humble way of life?");
		elseif(e.message:findi("Curse of Bloody Kithicor")) then
			e.self:Say("There was a great war that was fought not long ago between the Teir'Dal. and their evil minions. and the armies of Felwithe. Qeynos. Freeport. and Kaladim. In the Kithicor Woods the Daughter of Innoruuk. Lanys T'Vyl. and her minions fought against the chosen of Tunare. Firiona Vie. and her most loyal allies. The evil God of Hate. Innoruuk. intervened every living creature in the Kithicor Woods instantly fell dead as a great rift to the Plane of Hate appeared in the sky. Since that time. when night falls on the Kithicor Woods blood seeps from the trees and ground and the hateful dead hunt any living being who dares to trespass in the woods that ended their lives.");
		elseif(e.message:findi("face the Teir")) then
			e.self:Say("Some days ago one of our Storm Reapers. a ranger by the name of Botim Bonker. ventured into the Kithicor Forest at daybreak on a routine patrol and never returned. That night his bloodied tunic was found hanging on a fence post of Tagglefoots Farm. The blood was dried and many hours old. We believe that he was slain during the day and that deduction coupled with the fact the undead of Kithicor do not leave the woods nor possess the intelligence or means to sneak into Rivervale and leave the tunic where it would surely be found by fellow Storm Reapers led us to believe they were not responsible. We believe it was the work of the Teir'Dal. Search the Kithicor Woods by daylight and punish the Teir'Dal responsible. Return with the villains severed hands as proof of his death.");
		elseif(e.message:findi("trades")) then
			e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
			e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
		elseif(e.message:findi("second book")) then
			e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
			e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18431})) then -- Halfling Paladin Note
		e.self:Say("Karana smiles upon you young " .. e.other:GetName() .. "! Take this tunic to keep you warm through the storms you must face. There is evil encroaching upon the lands of Karana's faithful. The wicked minions of Bertoxxulous and the Teir'Dal children of Hate corrupt the lands to the west and east, and the Deathfist Clan of Orcs are waging war on this region while destoying the wilderness for lumber and stone. It is Karana's will that we defend our lands and way of life from these evil threats. When you are ready to begin adventuring, I will be happy to advise you on how to help us deal with the [evil forces]. I also posses knowledge of various [trades], seek me out when you wish to learn about them.");
		e.other:SummonItem(13541); -- Jumjum Sack Tunic*
		e.other:Ding();
		e.other:Faction(355,100,0); -- +Storm Reapers
		e.other:Faction(286,10,0); -- +Mayor Gubbin
		e.other:Faction(292,15,0); -- +Merchants of Rivervale
		e.other:Faction(324,-15,0); -- -Unkempt Druids
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19688})) then
		e.self:Say("Take this Dull Bravefoot Short Sword to the forge at Tagglefoots farm and sharpen it with a sharpening stone. It may take several attempts if you are unfamiliar with the process. Once that is done present the blade and a large snake skin to Bodbin Gimple and he will put the finishing touches on the sword.");
		e.other:SummonItem(19625); -- Item: Dull Bravefoot Short Sword
		e.other:Ding();
		e.other:Faction(355,10,0); -- +Storm Reapers
		e.other:Faction(286,10,0); -- +Mayor Gubbin
		e.other:Faction(292,10,0); -- +Merchants of Rivervale
		e.other:Faction(324,-15,0); -- -Unkempt Druids
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19049 -- Kaya_Cloudfoot
