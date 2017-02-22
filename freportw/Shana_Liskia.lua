function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met "..e.other:GetName()..". I am Shana Liskia. Enchantress of Freeport. I have studied my art for years here in our wonderful academy. I am also delighted to meet and teach those that come here to gain knowledge. My specialty however lies in Beguiling so I like to train young newcomers to our academy. Are you studying the ways of a [" .. eq.say_link("Magician") .. "] an [" .. eq.say_link("Enchanter") .. "] or a [" .. eq.say_link("Wizard") .. "]??");
	elseif(e.message:findi("magician") or e.message:findi("enchanter") or e.message:findi("wizard")) then
		e.self:Say("Wonderful! Let me be the first to tell you that your training here will be top notch and you will learn all that is to be known about being an enchanter should you put forth the willingness to learn. I will walk you through your early training and assist you in your hunting and gathering skills. I have created a [" .. eq.say_link("special sewing kit") .. "] that I present to all of the new initiates.");
	elseif(e.message:findi("diseases of the mind")) then
		e.self:Say("I study the mind. My most recent research deals with, well, I'd rather not discuss that. Unless you need something specific, I don't really have time for long random conversations right now.");
	elseif(e.other:Class() == "Enchanter" or e.other:Class() == "Magician" or e.other:Class() == "Wizard") then
		if(e.message:findi("special sewing kit")) then
			e.self:Say("This kit that I speak of is one that is able to magically infuse different components into materials used for creating Arcane Scientists Armor. The components that you use will be collected from numerous different areas and shops in Freeport. You will use these materials along with patterns that I will present you with to create your armor. Once you are [ready to begin] I will present you with your Enchanted Sewing Kit.");
		elseif(e.message:findi("ready to begin")) then
			e.self:Say("Very well. Here you are "..e.other:GetName()..". in this box you will combine specific component recipes as I mentioned before. When you are ready to attempt a specific piece you must tell me what piece you [want] to craft. For example if you had intent on crafting a cap you would say. [I want to craft a cap]. I can offer you the recipes for Arcane Scientists [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. I must also suggest that you attempt your robe last due to the difficult nature of collecting the correct components.");
			e.other:SummonItem(17260); -- Enchanted Sewing Kit
		elseif(e.message:findi("sleeve")) then
			e.self:Say("Sleeves will be a great and necessary addition to your armor. To create your sleeve material you will need to combine 2 Woven Spider Silks, 2 Bone Chips, 1 Spider Legs and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sleeves.");
			e.other:SummonItem(22586); -- An Enchanted Sleeves Pattern
		elseif(e.message:findi("bracer")) then
			e.self:Say("A wise choice indeed, having the correct wrist protection is very important in spell channeling. To create your bracer material you will need to combine 1 Woven Spider Silk, 1 Desert Tarantula Chitin, 1 Armadillo Tooth and a Cloth wristband in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Bracer.");
			e.other:SummonItem(22584); -- An Enchanted Bracer Pattern
		elseif(e.message:findi("cap")) then
			e.self:Say("A cap will keep you safe from any attackers as well as the elements. To create your cap material you will need to combine 2 Woven Spider Silks, 1 Snake Fang, 1 Chunk of Meat and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Cap.");
			e.other:SummonItem(22583); -- An Enchanted Cap Pattern
		elseif(e.message:findi("glove")) then
			e.self:Say("Gloves are very important for your early training especially Isola. While you are learning your first set of incantations you should not have to worry about any injuries to your hands. To create your glove material you will need to combine 3 Woven Spider Silks, 1 Giant Scarab Brain, 1 High Quality Cat Pelt 1 Zombie Skin and 1 Large Leaf Scarab Leg in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Gloves.");
			e.other:SummonItem(22588); -- An Enchanted Gloves Pattern
		elseif(e.message:findi("sandal")) then
			e.self:Say("Sandals will keep you save from any harmful things you may walk in, it is a good idea to have them. To create your sandal material you will need to combine 3 Woven Spider Silks, 1 Coyote Pelt, 2 Black Bear Paws, 1 Urticating Hairs and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sandals.");
			e.other:SummonItem(22585); -- An Enchanted Sandals Pattern
		elseif(e.message:findi("trouser")) then
			e.self:Say("I would always recommend pants to all my new students since they are a very important part of your armor set. To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Embalming Dust, 1 Rotting Zombie Skull and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Trousers.");
			e.other:SummonItem(22587); -- An Enchanted Trousers Pattern
		elseif(e.message:findi("robe")) then
			e.self:Say("I am very pleased to see that you have progressed through your armor pieces so quickly. I am also proud to see that you are ready to attempt your robe! To create your robe material you will need to combine 5 Woven Spider Silks, 1 Snake Bile, 1 Cutthroat Golden Tooth, 1 Shadow Wolf Tibia, 1 Orc Prayer Beads and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Robe. Be sure to come back to see me for a [final assignment] after you have completed your robe.");
			e.other:SummonItem(22589); -- An Enchanted Robe Pattern
		elseif(e.message:findi("final assignment")) then
			e.self:Say("I have a trinket that was given to me by my mother a long time ago. Before she died I told her I would always keep it close to me. Recently, some militia officers came in to our academy and confiscated anything that appeared to be valuable. Fearing for my life I did not fight to keep the necklace my mother gave me. The officer that took it was named Teridsan. If you should find him you have my permission to kill him if that's what it takes to get my necklace back. Return to me when you have my necklace along with 2 Lion Teeth.");
		else
			e.self:Say("Only casters may earn the rewards of the Academy!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:Class() == "Enchanter" or e.other:Class() == "Magician" or e.other:Class() == "Wizard") then
		if(item_lib.check_turn_in(e.trade, {item1 = 9917,item2 = 9917,item3 = 9933})) then -- Lion Tooth x 2, Shana's Necklace
			e.self:Say("Thank you for bringing back one of my most valued possesion. You have proven yourself to be worthy to wield the Dagger of the Academy.");
			e.other:SummonItem(9938); -- Dagger of the Academy
			e.other:Ding();
			e.other:AddEXP(100);
		end
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62617})) then
		e.self:Say("Well, this certainly is an interesting puzzle. I see here that these creatures were infected in their spinal columns. I'll tell you that a part of my research involves the use of the fluids of the brain and spine. I suspect that further details might be unpleasant. I might be able to help you, but I'll need materials to work with. Gather fluids from the brain of the creature with the greatest mental power that you can find. I'll test it and see if it's strong enough and has the right properties. If I can duplicate what you saw in these infected creatures, perhaps I can help. Aslo, bring back those notes that Corun made, I'll need them as well.");
		e.self:Emote("makes a few hasty scribbles in the margins of Corun's Notes and hands them back to you.");
		e.other:SummonItem(62654);
		eq.set_global("ranger_epic","2",5,"F");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 40420,item2 = 62654})) then
		e.self:Say("Perfect! Yes, this will work nicely. Shana looks through Corun's notes while gathering items from her stores. This should work. What I'm going to do is grow a crystal around this fluid and some of the key ingredients of the disease. The crystal will focus the power of the fluid and the elements of the disease will guide it. If this goes well, I should be able to create a crystal that will guide you to the disease. Shana places the gathered items into a violet-tinted container and casts a spell over them. A moment later she retrieves a crystal from the container. The crystal is clear except for a dark, murky coloration at the center. Take that crystal and see if you can locate any creatures with the disease. If you have any success, please return and let me know.");
		e.other:SummonItem(62846);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62618,item2 = 62619})) then
		e.self:Say("Ah, well, it seems as though the crystal was attuned to these other crystals. They must have come in contact with a rather large element of the disease, otherwise I just can't see how the Mind Crystal would have noticed them. These crystals were created by someone with more experience than I have in this area. I will examine them further and attempt to learn something from them. I can tell now, though, that they were probably created in a fashion similar to the one I used to create the Mind Crystal. Shana pulls out a piece of parchment and writes a note. She gives you the note and says, Take this note to Corun along with the Mind Crystal. He can use the crystal and my notes to seek out the plague in whatever fashion he thinks is best. I need to get to work investigating these new crystals.");
		e.other:SummonItem(62655);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62852,item2 = 62852,item3 = 62852})) then
		e.self:Say("Well these certainly are interesting. You say there might be more of them on those necromancers that escaped? Well here, take this. Find all of them and place them into this bag to keep them safe. Then bring them all to me and I'll examine them more closely. I can tell you that they are similiar to the Mind Crystal, but it appears to have different magical properties. I have never seen anything like them and I suspect that they are not from Norrath.");
		e.other:SummonItem(62852);
		e.other:SummonItem(62852);
		e.other:SummonItem(62852);
		e.other:SummonItem(62853);
		eq.set_global("druid_epic", "5", 5, "F");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 62854})) then  --Full Padded Bag
		e.self:Emote("takes the crystal fragments from the pouch. She applies a drop of liquid to it. The liquid turns the crystal white where it spreads.");
		e.self:Say("These small crystals are easier to work with than the Mind Crystal. They also differ from the Mind Crystal in that they are from the Plane of Discord. Take this mixture and find something to enhance its magical power and you just might be able to purify the Mind Crystal. I have no idea what that might be, but I know what it should be. You'll need two components. One will increase the power of the mixture, something with a lot of magical power. It needs to be a liquid or powder to integrate properly. And you'll need a stabilizer, something to help the mixture and the new material to remain stable. This influences the kind of attunement that the crystal takes on during the process. It should be something from nature if you want the result to suit your tastes. You'll have to find someone that knows of something about it among the druids for help on what to use.");
		e.other:SummonItem(62855); --Bowl of Foul-smelling Liquid	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Shana_Liskia