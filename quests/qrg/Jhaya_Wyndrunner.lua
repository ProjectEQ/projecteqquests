function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello there... I am Jhaya Wyndrunner; seamstress. druidic apprentice of The Rainkeeper, and native of the Jaggedpine Forest. It is a pleasure to make your acquaintance, but I really must be returning to my duties. Being away from the forest is so... troubling and I have a tendancy to become distracted when so far away from my home. But if you are member of the Jaggedpine alliance from Qeynos and The Rainkeeper guides your heart, then please, do return to me when you have gained a warm acceptance from your brethren in the Jaggedpine forest.");
	elseif(e.message:findi("jade studded")) then
		e.self:Emote("gives a gentle, almost musical chuckle of delight 'Nolan Greenwood must be quite excited to have his great talents be of interest and use once again. I will be more than willing to aid you in fulfilling my former mentor and dearest friend's task of you. Unfortunately, I am at a loss for the supplies that are necessary to aid you properly and my duties keep me safe in the Glade. I will need you to bring me two specific [items] and I will be happy to sew them into the tunic.'");
	elseif(e.message:findi("items")) then
		e.self:Say("The items I require for this tunic will not be easy to acquire, my friend and I do apologize for the turmoil that you will likely plunge yourself into to fulfill this task -- but as is the way of those whom defend the natural world. The two items I need of you are the [Pouch of Polished Jade Stones] and a [Black Rawhide Tunic].");
	elseif(e.message:findi("how to make")) then
		e.self:Say("To make the tunic, you will need to acquire the appropriate materials. These materials are a [Cured Panther Hide] and [Wisps of Potameid Hair]. These two items, if properly sewn together, will make the Black Rawhide Tunic that you will need to further your task to Nolan. But be wary, my friend. The tailoring of this item is not for the inept of this skill. You must master the thread and needle to be successful in sewing the tunic.");
	elseif(e.message:findi("black rawhide tunic")) then
		e.self:Say("That is an item that you must forge with your own skills, my friend. We of the Jaggedpine use the resources that nature allows us to the fullest extent and it is our law that when we embrace nature's gifts, that the one whom has gained those gifts must use their own hands and work to earn that gift -- for she has granted it to you, and you alone. I can tell you [how to make] the Black Rawhide Tunic and perhaps make this task a bit easier for one as new to our ways as yourself, my friend.");
	elseif(e.message:findi("Polished Jade Stones")) then
		e.self:Say("Our artisans of the Jaggedpine pride themselves on the beauty and quality of their products. The jade stone has become a sort of a symbol to those of us in the Jaggedpine and it is used almost exclusively to decorate all of our powerful tools. Unfortunately, many others have found the potential of these stones and have begun to reave them from us and our craftsman have been too occupied with the recent events to make any great supply of these items. You must [find] one of the [stolen pouches].");
	elseif(e.message:findi("stolen pouches")) then
		e.self:Say("With the creation of the passageway in Blackburrow to the Jaggedpine Forest, many of the poachers that are native to Qeynos soil have secretly made their way into our woodlands. They maliciously destroy our beautiful and sacred beasts solely for the purpose of monetary profit. We were not prepared to encounter such individuals and these thieves raided many of our establishments at Fort Jaggedpine. The artisans were not spared these barbarous acts and many of our precious stones were stolen. I know the name of the one who may have these stones -- [Greshvoule].");
	elseif(e.message:findi("Greshvoule")) then
		e.self:Emote("glares at the mention of the name 'Greshvoule was one of many poachers to invade our forest after the construction of the subterranean passageway. He is a very cunning thief and a warrior not to be trifled with. He. . . killed one of our artisans and a dear friend of mine, Callisa, who specialized in the art of carving and polishing these jade stones. One of the rangers native to the glade graced me with his favor and found that the barbarian known as Greshvoule is hiding in Permafrost, trying to escape proper justice for his crimes against the glade. If you could find him and avenge the wrongs committed against my dear friend and the glade, I would be eternally grateful.'");
	elseif(e.message:findi("cured panther hide")) then
		e.self:Say("The poachers that have invaded our forest are far from having any mutual arrangement with the world they carelessly reave from. One such poacher, Elishia Blackguard of the Blackguard family is known to 'specialized' in furs. She has been seen skinning the corpses of our forest panthers and despite how despicable her actions are she truly is worthy of her reputation. Likely if you find her, you will find a Flawless Panther Hide. Once you have retrieved the hide and the [gifts of the forest], take the items to my brother, Lerian, who you will find here in the glade.");
	elseif(e.message:findi("gifts of the forest")) then
		e.self:Say("The great pines in our forest are a constant and generous source of sap. You can harvest this sap without harming the woodlands by foraging. The second gift is the Dew of the Hatchling, which you shall also find without turmoil as the forest will freely give it if you take the time to seek it out.");
	elseif(e.message:findi("wisps of potameid hair")) then
		e.self:Say("When the folk of the Jaggedpine came to the forest many centuries ago, the Potameides and other nymphs were plentiful across the whole of Norrath's then untainted wilderness. The Potameides assisted our ancestors, teaching them how to harvest safely from the forest and had given us the gifts of their spiritual essence with their blessings. This essence was essential in developing the powerful tools that Nolan has you questing for now. But, as the time passed and civilizations grew, these spirits of nature perished when the nature they are bound to were interrupted with the construction of these cities. The Potameides of the Hatchling are the only naiads of Norrath that any know to still exist. It is this extinction that they face which has made acquiring this essence so [trying].");
	elseif(e.message:findi("trying")) then
		e.self:Say("The Potameides have become. . . hostile toward any mortal that dares to tread in their territory. This hostility is understandable, but it is not for natural reasons. Our neighbors to the north made a pact with Queen Nhyalia of the Hatchling, and the Potameides abide by this pact -- to destroy any that dares to cross the river. Some of us believe that they have become corrupt by abiding mortal requests and becoming pawns to our feral, wildling neighbors. Unfortunately, one must use force to retrieve the essence. But, do not be discouraged, my friend. The destruction of the Potameides is temporary, for as long as the river itself remains untainted, each spirit will return to guard her sacred home. You must seek out the Potameid Maidens, whose hair will hold the essence you need.");
	elseif(e.message:findi("shadowjade circlet")) then
		e.self:Say("I see that Cheyloh has been keeping herself quite busy with the recent opening of our lands to Qeynos, and I am pleased to know that our brethren of the world beyond the Jaggedpine have an interest in our ways. I will aid you to create the circlet, but I must ask that you brave the wilds and turmoil of this world to retrieve two items that I will then weave into the circlet for you. The items I need are a Shadowjade Weave, which you will make with your own hands by weaving two Shadowjade Vines and two strands of Shadowjade Moss together -- both components you may find by foraging through the Jaggedpine forest. Be sure that your mastery of tailoring is up to par when attempting this feat, for the components are delicate and will be destroyed in the hands of the inexperienced. The second item I am in need of is a [Blackened Mithril Chain].");
	elseif(e.message:findi("blackened mithril chain")) then
		e.self:Say("The artisans of Qeynos have provided a wonderful counterpart to our natural, although nearly depleted resource that was once used when making this line of our sacred armor. Unfortunately, the one who last attempted to retrieve the chain was killed in Lavastorm by one of the poachers, who seek the Blackened Mithril for their own reasons -- likely to steal our recipe and sell the corrupted versions of these treasured items on the underground market of Norrath. In any case, we have heard that the chain was sold to one appropriately named Nyuae the Cruel -- a Teir'Dal enchantress. What her motives are, I am unsure of, but we do know that she has taken refuge in the Ocean of Tears. Retrieve the Blackened Mithril Chain and return it to me with the Shadowjade Weave.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 8763,item2 = 8762})) then -- black rawhide tunic and pouch of polished jade stones
		e.self:Say("Excellent, my friend! Well done indeed. These are exactly what I needed to make the tunic Nolan has requested of you. And. . . thank you for avenging my dear, departed friend. She shall be missed, and it is in her memory that I give you the Jade Studded Tunic. Go now, my friend. Nolan awaits and I am sure that he will be most impressed with your success thus far");
		e.other:SummonItem(8761); -- jade-studden rawhide tunic
		e.other:Ding();
		e.other:Faction(271,20,0);  -- Residents of Jaggedpine
		e.other:Faction(159,20,0);  -- Jaggedpine Treefolk
		e.other:Faction(265,20,0);  -- Protectors of Pine
		e.other:Faction(135,20,0);  -- Guards of Qeynos
		e.other:AddEXP(2000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 8884,item2 = 8885})) then -- blackened mithril chain & shadowjade weave
		e.self:Say("Excellent, my friend! Well done indeed. These are exactly what I needed to make the circlet. Go now, my friend. Cheyloh awaits and I am sure that he will be most impressed with your success thus far.");  -- text made up/adapted from the tunic reward
		e.other:SummonItem(8883); -- shadowjade circlet
		e.other:Ding();
		e.other:Faction(271,20,0);  -- Residents of Jaggedpine
		e.other:Faction(159,20,0);  -- Jaggedpine Treefolk
		e.other:Faction(265,20,0);  -- Protectors of Pine
		e.other:Faction(135,20,0);  -- Guards of Qeynos
		e.other:AddEXP(2000);

	end
	item_lib.return_items(e.self, e.other, e.trade)
end
