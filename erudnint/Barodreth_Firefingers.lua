-- NPC ID: 23076
-- NPC Name: Barodreth Firefingers
-- Zone: erudnint
-- items: 61094, 22584, 22583, 22633, 22585, 22631, 22632, 22634, 19552, 19659, 13424, 63125

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Are you a [" .. eq.say_link("young initiate") .. "] of the Craft Keepers? If you are then I might have some great news for you. We are currently in the process of training up all new recruits so this might be your lucky day.", e.other:GetCleanName()));
	elseif (e.message:findi("young initiate")) then
		e.self:Say(string.format("Excellent, %s. Many have passed before me and said they wished to be the greatest practicioner of the arcane to ever set foot in these halls. Many of those same people didn't amount to much but I think you are different. If you are I will be happy to get you started.", e.other:GetCleanName()));
	elseif (e.message:findi("begin")) then
		e.self:Say("Fantastic, I will be delighted to get you started. Toxxulia forest is where the majority of your training will be held. There are many [" .. eq.say_link("important components") .. "] I will need you to [" .. eq.say_link("gather") .. "] out in the forest and also in town.");
	elseif (e.message:findi("important components")) then
		e.self:Say(string.format("All right then, %s, here is your Craft Keepers Sewing Kit. In this sewing kit you will combine a number of recipes that will be used for creating your Craft Keepers armor. When you are ready to craft a certain armor piece all you must do is tell me which piece you want to craft. I will then present you with the component recipe along with the applicable pattern for Craft Keeper [" .. eq.say_link("Caps") .. "], [" .. eq.say_link("Bracers") .. "], [" .. eq.say_link("Sleeves") .. "], [" .. eq.say_link("Sandals") .. "], [" .. eq.say_link("Trousers") .. "], [" .. eq.say_link("Gloves") .. "] and [" .. eq.say_link("Robes") .. "]. When you have completed the material for whatever piece you asked for you will combine it in a sewing kit with the appropriate pattern to fashion your armor piece. Its as easy as that. I suggest though that you attempt your robe last as the components are more difficult then any other piece to collect.", e.other:GetCleanName()));
		e.other:SummonItem(61094); -- Item: Craft Keepers Assembly Kit
	elseif (e.message:findi("bracer")) then
		e.self:Say("To create your bracer material you will need to combine one Woven Spider Silk, two Bone Chips, one Fire Beetle Leg and one Red Wine in your assembly kit. Once you have created the proper material, take it to a sewing kit along with this pattern to fashion your very own Bracer of the Craft Keeper.");
		e.other:SummonItem(22584); -- Item: Enchanted Bracer Pattern
	elseif (e.message:findi("cap")) then
		e.self:Say("To create your cap material you will need to combine two Woven Spider Silks, one Rat Ear, one Spiderling Legs and one Short Ale in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Cap of the Craft Keeper.");
		e.other:SummonItem(22583); -- Item: Enchanted Cap Pattern
	elseif (e.message:findi("gloves")) then
		e.self:Say("To create your gloves material you will need to combine three Woven Spider Silks, one Rat Whiskers, one Snake Scales and one Bat Wing in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Gloves of the Craft Keeper.");
		e.other:SummonItem(22633); -- Item: Enchanted Gloves Pattern
	elseif (e.message:findi("sandals")) then
		e.self:Say("To create your boot material you will need to combine three Woven Spider Silks, one Kobold Skull, one Snake Fang and one Ration in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sandals of the Craft Keeper.");
		e.other:SummonItem(22585); -- Item: Enchanted Sandals Pattern
	elseif (e.message:findi("sleeves")) then
		e.self:Say("To create your armguards material you will need to combine two Woven Spider Silks, one Spider Legs, one Fire Beetle Leg and one Bandage in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Sleeves of the Craft Keeper.");
		e.other:SummonItem(22631); -- Item: Enchanted Sleeves Pattern
	elseif (e.message:findi("trousers")) then
		e.self:Say("To create your trousers material you will need to combine four Woven Spider Silks, two Spiderling Silks, one Skunk Scent Gland and one Bottle of Kalish in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Trousers of the Craft Keeper.");
		e.other:SummonItem(22632); -- Item: Enchanted Trousers Pattern
	elseif (e.message:findi("robe")) then
		e.self:Say("To create your robe material you will need to combine five Woven Spider Silks, one Giant Wood Spider Thorax, one Skunk Tail, one Spider Venom, one Fire Beetle Leg and one Giant Rat Tooth in your assembly kit. Once you have created the proper material take it to a sewing kit along with this pattern to fashion your very own Robe of the Craft Keeper. Please return to me once you have fashioned your robe for I might have a [" .. eq.say_link("final task") .. "] for you to complete.");
		e.other:SummonItem(22634); -- Item: Enchanted Robe Pattern
	elseif (e.message:findi("final task")) then
		e.self:Say("There are a few items that I need for my studies and I was hoping that you could retrieve them for me. If you are willing to [" .. eq.say_link("seek out my items") .. "] I will be happy to reward you with my personal walking staff once you return.");
	elseif (e.message:findi("seek out")) then
		e.self:Say("Please retrieve one Calcified Ribcage, one Kobold Hide, one Twilight Bloom and one Giant Wood Spider Femur. I will eagerly await your return.");
	end
end

function event_item(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 19552, item2 = 19659, item3 = 13424, item4 = 63125})) then -- Dagger of the Craft Keeper
		e.other:QuestReward(e.self, {itemid = 61099});
		e.self:Say(string.format("Very good, %s, and here is your reward as promised.", e.other:GetCleanName()));
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
