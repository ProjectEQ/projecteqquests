--provinggrounds/#Stilled_Lightning_Warrior.lua NPCID 316042 
--Shaman Epic 2.0
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["shaman_epic"] == "9") then
		--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Lightning Warrior Spiritseeker
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
