-- Cleric 1.5 Epic  // Harmony of the Soul // -- Drogerin

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 56010})) then  -- Talisman of the Plasmatic Priests
	eq.other:SummonItem(56010);  -- She returns it to you before despawning
	eq.spawn2(NPCID,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- She respawns as High Priestess Shima -- Need NPCID here.
	eq.depop_with_timer();  -- unknown amount on her timer here.
	end
	item_lib.return_items(e.self, e.other, e.trade);
end