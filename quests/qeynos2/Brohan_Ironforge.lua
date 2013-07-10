function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please, leave me be alone. I have such sorrow in my heart.. I wish to be alone with my thoughts.");
	elseif(e.message:findi("sorrow")) then
		e.self:Say("My daughter Tayla has left and I fear she will not return. If only I could find someone.. Hey, would you like to do a favor for an old man or are you too busy?");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Tayla is my oldest and youngest daughter. Unlike the rest she is of a different mother. She is part elven. She appears to be physicaly younger than the rest, but she has spent more years as my daughter than all the others. Tayla is from my first marriage to Weleana.");
	elseif(e.message:findi("where")) then
		e.self:Say("My daughters have informed me that Tayla has runaway to live with the elves of Kelethin. Apparently life among the human citizens of Qeynos was not very kind to her. I wish her well, but I wish I knew she was safe.");
	elseif(e.message:findi("hurrieta")) then
		e.self:Say("Hurrieta is a good woman. She has a bit repulsed that I once was married to a wood elf. She got over that I believe. We had four children together. The children seem quite accepting of Tayla, even though she is a half elf.");
	elseif(e.message:findi("favor")) then
		e.self:Say("Good. Please find my daughter, Tayla Ironforge. Bring me proof that she is safe. She was last seen near Nektulos. I am a fine blacksmith and I shall give you a worthy gift if you do this for me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18863})) then -- Sealed Letter
		e.self:Say("Oh! thank you! Now I know she is safe. My sweet Tayla. Here is your reward, as promised. A hero such as yourself deserves a weapon with which to uphold your noble values.");
		local random_item = eq.RandomNumber({5303,5304,5305,5313,6303,6311,6312,7300,7301,7311,7499});
		e.other:SummonItem(random_item);
		e.other:Ding();
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:Faction(47,10,0); -- Coalition of Tradefolk
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(217,10,0); -- Merchants of Qeynos
		e.other:Faction(33,-10,0); -- Circle of Unseen Hands
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
