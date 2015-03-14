-- poknowledge\Willamina.lua NPCID 202057 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Hello and good morning " .. e.other:GetName().. " It's such a lovely day to sit and enjoy the beautiful surroundings. is it not?  I do hope you find what you are looking for here. Not all of us have been so successful in our individual [" .. eq.say_link("quests",false,"quests") .. "] the shroud.");
		elseif(e.message:findi("quests")) then
			e.self:Say("The city is full of curious people all searching for something. Many have struggled for a long time to find their reward. Some are not even aware of what is it they are looking for, but will know it when they see it. Would you care to [" .. eq.say_link("help",false,"help") .. "] me out? It will only take a moment.");
		elseif(e.message:findi("help")) then
			e.self:Say("How wonderful! To pass the time I enjoy sitting under the trees and sewing together luscious fabrics. But now it seems my old sewing needles have all broke or gone dull, and I require a new supply. Bolcen Tendag has promised to purchase and deliver some for me, but he has not yet arrived and I worry about him. If you could locate him and ask him about the needles I would appreciate it.");
		end
end 

function event_trade(e)
	local item_lib = require("items");

		if(item_lib.check_turn_in(e.trade, {item1 = 28092})) then --New Sewing Needles
			e.self:Emote("takes the needles and smiles. 'Thank you so much, kind stranger. I can't tell you how much you have really helped by doing this for me. It's funny, you know. The entire city seems to be in a happier mood today. I can't quite put my finger on it, but everyone seems to have uplifted spirits. Oh well, thank you again. I have something you may find to be of use to you, if you would be interested. Remember, knowledge is the key to life.");
			e.other:SummonItem(28745); -- Planar Traveler's Manual
			e.other:Ding();
			e.other:AddEXP(250);
		end

	item_lib.return_items(e.self, e.other, e.trade)
end
  
