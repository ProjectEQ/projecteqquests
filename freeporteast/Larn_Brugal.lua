function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetName() .. " I hope you yearn to become a Steel Warrior as we all are here in the Bunker. We are in need of more recruits to continue the [war].");
	elseif(e.message:findi("war")) then
		e.self:Say("The war I speak of is the one we Steel Warriors have sworn to wage agianst [Clan Deathfist] in the Commonlands. We are doing a fine job but we require more weapons. We are expecting a shipment of blades from Groflahs Forge. We require a warrior of the bunker to [get our shipment]. Maybe you.");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("If you do not know of Clan Deathfist go ask Cain who they are. He will not only tell you he will sign you up to help fight our war!");
	elseif(e.other:GetClass() == 1) then
		if(e.message:findi("shipment")) then
			e.self:Say("We would be most thankful for your service. Please take this voucher over to Groflah at Groflahs Forge in North Freeport. He will give you the shipment of weapons.");
			e.other:SummonItem(1717);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12241,item2 = 12242,item3 = 12243,item4 = 12244})) then -- Raw Short Sword 1-4
		e.self:Say("I heard you were on your way back. Here then. Let us sharpen that blade for you. There you are. That should be much better in a fray now.");
		e.other:SummonItem(5418); -- Groflar's Stoutbite
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9113 -- Larn_Brugal