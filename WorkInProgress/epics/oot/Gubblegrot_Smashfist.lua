--oot/Gubblegrot_Smashfist.lua NPCID 69140
--SK Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shadowknight_epic"] == "6") then
		--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --lvl 66 version, currently not in db
		eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	