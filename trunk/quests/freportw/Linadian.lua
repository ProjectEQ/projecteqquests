function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Greetings. Please look through my fine wares. I have spent my whole life practicing my skills in tailoring. I do my best to compete with the other local merchants, but I have yet to make A profit. I pray to Tunare that my [Banded Orc Vests] will finally bring me A few extra coins.");
	elseif(e.message:findi("Banded Orc Vests")) then
		if(fac < 6) then
			e.self:Say("Glad you are interested! I can create A leather vest I call A Banded Orc Vest. It will aid you in repelling any disease and offers quite A bit of protection in battle. I will need some materials. For A Deathfist Banded Orc Vest, I require two Deathfist Shoulderpads worn by the Clan Deathfist, one Deathfist Slashed Belt, and ten gold coins. For A Crushbone Banded Orc Vest, I require two Crushbone Shoulderpads worn by the Clan Crushbone, one Crushbone Belt, and ten gold coins.");
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13917,item2 = 13917,item3 = 13916,item4 = 13916,gold = 10})) then -- 2x Deathfist Shoulderpads, 2x Deathfist Slashed Belt, 10 gold
		e.self:Say("Grand doing business with you. Hold your nose. I can never get rid of the Orc stench of the vests. That is why the other merchants do not pay me much for them.");
		e.other:SummonItem(12187); -- Banded Orc Vest
		e.other:Ding();
		e.other:Faction(174,1,0); -- Kelethin Merchants
		e.other:Faction(99,1,0); -- Faydark's Champions
		e.other:Faction(92,1,0); -- Emerald Warriors
		e.other:Faction(8,1,0); -- Anti-mage Faction
		e.other:AddEXP(150);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13319,item2 = 13319,item3 = 13318,item4 = 13318,gold = 10})) then -- 2x Crushbone Shoulderpads, 2x Crushbone Belt, 10 gold
		e.self:Say("Grand doing business with you. Hold your nose. I can never get rid of the Orc stench of the vests. That is why the other merchants do not pay me much for them.");
		e.other:SummonItem(12187); -- Banded Orc Vest
		e.other:Ding();
		e.other:Faction(174,1,0); -- Kelethin Merchants
		e.other:Faction(99,1,0); -- Faydark's Champions
		e.other:Faction(92,1,0); -- Emerald Warriors
		e.other:Faction(8,1,0); -- Anti-mage Faction
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Linadian