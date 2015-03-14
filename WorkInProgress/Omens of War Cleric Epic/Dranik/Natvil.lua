-- Cleric 1.5 // Cleric 2.0 Epic // Harmony of the Soul // Aegis of Superior Divinity  --Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:HasItem(9955)) then -- Player has Harmony of the Soul
			e.self:Emote("examines your craftsmanship. 'Impressive, but I'm afraid that the temper was not sufficient to unlock the full potential of the shield. For now you may use it in its current state. I suspect to fully realize the latent potential of the shield you will require a soulstone from the person who it was bound to originally as well as a Globe of Discordant Energy. Return to me when you have that, I will assist you in completing its enhancement.");
		else
		e.self:Say("Greetings, well met, salutations, and good day! I hear you are trying to change the resonance on a shield from Discord. Well I believe that is something with which I can assist you. You will need to have a temper made from some of the native creatures of Discord, you'll need the plasma from one of the giants of Discord, one of those flying squids, and the plasma from one of those fiery women. Brewing the temper should prove no trouble for you. Once you have the temper combine it with the shield in the forge with a flask of water, and it should become attuned to you. Once you are finished return to me, so I may evaluate your work.");
		end
	elseif(e.other:HasItem(47100)) then -- Player has Globe of Discordant Energy from Anguish for Final Turn-in.
		e.self:Say("Greetings. The metals of Discord are quite amazing. I could spend a lifetime just studying their properties.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 56014, item2 = 47100, item3 = 9955})) then   -- Soulshard // Globe of Discordant Energy // Harmony of the Soul  Turn-in
			e.self:Say("Amazing! You have found everything.' He then pulls deftly complete the shield. 'Quickly, take this back. It will bind itself to you. You have done well.");
			e.other:Ding();
			e.other:AddExp(10000); -- not sure how much exp to reward
			e.other:SummonItem(20076); -- Aegis of Superior Divinity // Grant Title High Priest/High Priestess//10AAs
		end
		item_lib.return_items(e.self, e.other, e.trade);
end
		