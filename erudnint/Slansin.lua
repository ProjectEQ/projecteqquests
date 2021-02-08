-- Inert Potion
-- items: 13983

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome! Please feel free to look around");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13983})) then
		if(e.self:GetClass() == 41) then
			e.self:Say("Thank you. I have been expecting this. We require it for mixing.");
			e.other:Ding();
			e.other:Faction(231,-5,0); -- Faction: Craftkeepers
			e.other:Faction(266,-5,0); -- Faction: High Council of Erudin
			e.other:Faction(265,1,0); -- Faction: Heretics
			e.other:Faction(267,-5,0); -- Faction: High Guard of Erudin
			e.other:AddEXP(300);
			eq.depop();
		elseif(e.self:GetClass() == 14) then
			e.self:Say("Ha!! What a fool!! I have stolen another potion to add to the crate. I shall make a fortune!! The real Slansin is in back. Now it is time for me to leave.");
			e.other:Faction(336,5,0); -- +Coalition of Tradefolk Underground
			e.other:Faction(229,5,0); -- +Coalition of Tradefolk
			e.other:Faction(329,5,0); -- +Carson McCabe
			e.other:Faction(230,5,0); -- +Corrupt Qeynos Guards
			e.other:Faction(330,5,0); -- +Freeport Militia
			e.other:AddEXP(300);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23001 -- Slansin
