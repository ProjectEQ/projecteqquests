-- items: 14319
function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 14319})) then
		e.self:Say("Error! Malfunction! Destroy!");
		e.self:Say("A " .. e.other:Class() .. " like you always bring out the worst in me.");
		eq.spawn2(72106,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: an_enraged_golem
		eq.depop_with_timer();
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
