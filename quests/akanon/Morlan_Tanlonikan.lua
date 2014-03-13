function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings there " .. e.other:GetName() .. "! I am Morlan Tanlonikan Assassin of Akanon. I pride myself on being one of the few to train our younger prospects in the ways of the rogue. If you are a young gnome rogue in training then I might have some [tasks] for you.");
	elseif(e.message:findi("tasks")) then
		e.self:Say("Well I should hope you are truly a Rogue of Akanon or else I dont have any work for ya! However if you are then I have some things for you to do. I will present you with a magical box that you will use to craft together certain components that will make an armor material. You will then take the material that you have fashioned with the proper pattern to the forge to create your own armor. I will provide you with whatever patterns are necessary along with the armor [recipes] should you so ask.");
	elseif(e.message:findi("recipes")) then
		e.self:Say("I have the armor recipes for all pieces of Chainmail of the Shadowwalker all you must do is simply ask for whichever piece you want to craft. I can provide you with the recipe for Shadowwalker [Coifs], [Bracers], [Sleeves], [Boots], [Leggings], [Gloves] and [Tunic]. Once you have collected the necessary components for each recipe combine them in this box to fashion the correct material.");
		e.other:SummonItem(17254); 	-- Welnos Assembly Kit
		e.other:Ding();
	elseif(e.message:findi("boots")) then
		e.self:Say("There are many things in the Steamfont Mountains that I am sure you don't want to step in " .. e.other:GetName() .. ". To create your boot material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 2 Spiderling Eyes and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Boots.");
		e.other:SummonItem(19634); 	-- Crude Boot Mold
		e.other:Ding();
	elseif(e.message:findi("bracer")) then
		e.self:Say("A pair of these here bracers will be a great addition to your armor set there " .. e.other:GetName() .. ". To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Runaway Clockwork Motor, 1 Infected Rat Liver and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Bracer.");
		e.other:SummonItem(19632); 	-- Crude Bracer Mold
		e.other:Ding();
	elseif(e.message:findi("coif")) then
		e.self:Say("While you should usually be using the shadows to your advantage should you need to face your opponent having a good coif will greatly increase your chances of survival. To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Rat Meat, 1 Grikbar Kobold Fur and 1 Throwing Knife in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Coif.");
		e.other:SummonItem(19631); 	-- Crude Helm Mold
		e.other:Ding();
	elseif(e.message:findi("gloves")) then
		e.self:Say("Well you sure cant pick someones pocket with a broken hand now can you? I agree that gloves would be a great armor piece for you to craft. To create your glove material you will need to combine 3 Bricks of Crude Bronze, 1 Yellow Reculse Silk, 1 Brownie Leg , and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Gloves.");
		e.other:SummonItem(19633); 	-- Crude Gauntlets Mold
		e.other:Ding();
	elseif(e.message:findi("leggings")) then
		e.self:Say("What do you think you are doing running around here with no pants on! To create your leggings material you will need to combine 4 Bricks of Crude Bronze, 1 Kobold Tooth, 1 Plague Rat Tail , 1 Bottle and the Torn Cloak of Faerron in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Leggings.");
		e.other:SummonItem(19636); 	-- Crude Greaves Mold
		e.other:Ding();
	elseif(e.message:findi("sleeves")) then
		e.self:Say("Having the proper sleeves will definitely be to your advantage when in a heated battle. To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Brownie Brains and 1 Young Ebon Drake Wing in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Sleeves.");
		e.other:SummonItem(19635); 	-- Crude Vambrace Mold
		e.other:Ding();
	elseif(e.message:findi("tunic")) then
		e.self:Say("I'm glad to see that you have progressed this far in your training and that you are ready to craft your final armor piece. To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Minotaur Scalp, 1 Brownie Parts, 1 Runaway Clockwork Motor, 1 Swirling Mist and the evil Dirolensab`s Bracer in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Shadowwalkers Chainmail Tunic. When you are finished with your tunic please come back to see me as I have a [favor] to ask of you.");
		e.other:SummonItem(19637); 	-- Crude Breastplate Mold
		e.other:Ding();
	elseif(e.message:findi("favor")) then
		e.self:Say("Well you see I have been working on constructing some new daggers for all new rogues but I am in need of a few items to make my first prototype. If you were able to collect the rare items I am in need of to make this dagger I would be happy to give you the first I make should I be able to create it. Will you [collect] these rare items for me?");
	elseif(e.message:findi("collect")) then
		e.self:Say("Excellent please seek out 2 Minotaur Scalps and 2 Mountain Lion Jawbones and return to me with them when you are done.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9108,item2 = 9108, item3 = 9109, item4 = 9109})) then -- Minotaur Scalp x 2, Mountain Lion Jawbone x 2
		e.self:Say("Here is that dagger I promised you " .. e.other:GetName() .. "!");
		e.other:SummonItem(9110); 	-- Gemmed Shadowwalkers Dagger
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
