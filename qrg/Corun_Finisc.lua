-- items: 13700, 13231, 13232, 13230, 62811, 62605, 62657, 62615, 62611, 62612, 62613, 62614, 62616, 62617, 62846, 62655, 62844, 62624, 62625
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. My name is Corun Finisc and I am one of the Jaggedpine Treefolk. It is our divine responsibility to watch over and protect Surefall Glade and its [" .. eq.say_link("inhabitants") .. "] from those who seek to [" .. eq.say_link("destroy") .. "] them.");
	elseif(e.message:findi("inhabitants")) then
		e.self:Say("The bears of Surefall Glade are our brothers. We are all children of [" .. eq.say_link("Tunare") .. "]. We would gladly die in their defense.");
	elseif(e.message:findi("tunare")) then
		e.self:Say("Tunare is the Mother of All. It is though Her will that we protect this land and its many creatures.");
	elseif(e.message:findi("destroy")) then
		e.self:Say("Poachers in seach of bear skins and [gnolls] who attack us unprovoked. We are doing all we can to stop them. May [" .. eq.say_link("Tunare") .. "] give me the strength needed to smite them dead with my [" .. eq.say_link("crook") .. "].");
	elseif(e.message:findi("crook")) then
		e.self:Say("My crook? The Jaggedpine crook is an enchanted weapon of the Jaggedpine Treefolk. The [" .. eq.say_link("Sabertooths") .. "] take great pleasure in destroying the crooks of any Treefolk they manage to slay. If you were to recover the pieces of a broken crook, I would gladly mend it for you.");
	elseif(e.message:findi("Sabertooths")) then
		e.self:Say("The Sabertooths are a vicious band of gnolls who live in Blackburrow, to the east of Surefall Glade. They constantly attack us when we only seek to share this land with them. They also send many patrols out into the Qeynos Hills to the south. We have even seen a Sabertooth skulking about in the caves behind Grizzly Falls. There is a [" .. eq.say_link("reward") .. "] for his hide.");
	elseif(e.message:findi("reward")) then
		e.self:Say("Yes. We are offering a small reward for slaying the skulking gnoll in the bear caves. Bring me his paw to claim your bounty. The Jaggedpine Treefolk remember well those who aid their cause.");
	elseif(e.message:findi("sabertooths")) then
		e.self:Say("The gnolls of Blackburrow are called Sabertooths. They have been seen in force on a regular basis. They are surely up to something.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local random_copper = math.random(10);
	local random_silver = math.random(10);
	local random_gold = math.random(10);
	local random_planinum = math.random(10);

	if(item_lib.check_turn_in(e.trade, {item1 = 13700})) then
		e.self:Say("Thank you for tracking down the filthy little poacher. Take this as your reward."); -- This is not from live as I have not seen the little bugger on live yet.
		e.other:Ding();
		e.other:Faction(302,10,0); -- Faction: Protectors of Pine
		e.other:Faction(272,10,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(306,-30,0); -- Faction: Sabertooths of Blackburrow
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:AddEXP(1500);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13231,item2 = 13232})) then
		e.self:Say("Excellent! Here is a Jaggedpine Crook of your own. Please use it only to defend yourself and never to attack one of Tunare's creatures. You will find that while wielding the crook, Tunare grants you a boon of strength and the power to smite enemies who would otherwise be impervious to physical attacks.");
		e.other:SummonItem(13230); -- Item: Jaggedpine Crook
		e.other:Ding();
		e.other:Faction(302,10,0); -- Faction: Protectors of Pine
		e.other:Faction(272,10,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(306,-30,0); -- Faction: Sabertooths of Blackburrow
		e.other:Faction(262,10,0); -- Faction: Guards of Qeynos
		e.other:AddEXP(1500);
		e.other:GiveCash(random_copper,random_silver,random_gold,random_planinum);		
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62811})) then
		e.self:Say("Well, this is certainly an unpleasant sight. If Althele sent you to me it must be because I've had a lot of experience with sick animals. If you can find me some animals that have become ill by eating this plant perhaps I can discover something about this disease. You must not kill these animals. It is never good to harm an animal if you do not need to. It is also important that the animal be alive when you take samples of their blood. If any animals have eaten this plant and become ill, you need to find a way to capture them and use your fletching kit and these vials to gather blood samples. Althele is rarely wrong about what she senses from Antonica. Be careful with that medicine bag, I borrowed it from a friend in Halas a while back. I'll need you to use it to store some samples as you capture the animals. Don't lose it, you don't want Lars angry with you!");
		e.other:SummonItem(62605); -- Item: Borrowed Medicine Bag
		e.other:SummonItem(62657,6); -- Item: Magical Sample Vial
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62615})) then
		e.self:Emote("looks over the contents of the medicine bag with a thoughtful expression. 'I wonder if this illness can affect so-called sentient beings. Take this back for now. Go and seek intelligent creatures that may have been affected by this illness. I don't care if you have to kill them, that's fine. Such beings are not of my concern. A couple of samples of their blood should be enough for me to discover something about this disease. I have been hearing from others that the course of this disease is not natural. As your own work corroborates, this illness has spread across species and locations that indicate an unnatural force. Please hurry, even I am beginning to believe that the term plague is appropriate in this situation. I shudder to think how this might affect this sacred glade.");
		e.other:SummonItem(62605); -- Item: Borrowed Medicine Bag
		e.other:SummonItem(62611); -- Item: Sickly Mosquito Blood Sample
		e.other:SummonItem(62612); -- Item: Twitching Swordfish Blood Sample
		e.other:SummonItem(62613); -- Item: Bloated Drogan Spider Blood Sample
		e.other:SummonItem(62614); -- Item: Leprous Chokidai Blood Sample
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62616})) then
		e.self:Say("This is frightening. A disease that can affect mosquito and wyvern must be a truly horrible thing. I will examine these samples carefully and pass knowledge to others who are working to repair this. From what you've shown me I can tell that the disease affects both the mind and the skin. Others seek information about illnesses of the skin. I need you to uncover information about diseases of the mind. I know not where to find such information, but you are a seeker and a worthy ranger. Find someone, somewhere, that knows enough about disease that affects 'more advanced' creatures such as men. Learn about the diseases of the mind. I will seek among the folk of the glade and pine for assistance with a cure for the Maiden's Hair. Please do not give up the search, no matter how difficult. This is a terrible illness and we must stop it from spreading. Take a copy of my notes with you, they may be of use to someone with the right knowledge.");
		e.other:SummonItem(62617); -- Item: Corun's Notes
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62846,item2 = 62655})) then
		e.self:Emote("looks at the crystal for a moment; confusion, disgust and curiosity chasing each other across his tired face. After reading the letter, he looks up at you."); 
		e.self:Say("This crystal seems strange, but if you and this Shana believe that it will help, then I know just the person to put it to work.' Corun puts the note and the crystal into a pouch. He reaches into another pouch to retrieve something small and hands it to you. 'This seed was brought to us by a druid of great skill. It should provide the cure we seek, but we do not know the place or circumstances under which to plant it. We have agreed to leave it to you to find that place and that time. I urge you to hasten, we do not know how long it will be until the plague is released upon us in earnest. The only thing that I know is that there may be a link between those that created the disease and the Plane of Discord. A very tenuous link, but keep the seed with you at all times, you never know when you will need it. May the Mother smile on your effort.");
		e.other:SummonItem(62844); -- Item: Red Dogwood Seed
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62624})) then
		e.self:Emote("look at the seed, perplexed for a moment. Then he suddenly goes into motion. He pulls a sheaf of papers from a backpack and riffles through them. He mutters to himself as he compares the seed to sketches in the notes. This is it! If we plant this seed and its seeds widely enough, it should protect and even cure the Maiden's Hair with its pollen! You've done it! Thank you! The Glade thanks you. You've saved many good and fair things from death. Corun looks crestfallen for a moment. I only wish I had something to give you to express our appreciation. From what you have told me I think this may help you. It is a rare metal, I hope you can find a worthy use for it.");
		e.other:SummonItem(62625); --Block of Purest Silver			
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3 or e.wp == 18 or e.wp == 29) then
		e.self:Shout("Heed the wishes of Tunare and leave the bears of Surefall Glade undisturbed!");
	elseif(e.wp == 11) then
		e.self:Say("By the will of Tunare, I serve this glade until I become one with it.");
	end
end
