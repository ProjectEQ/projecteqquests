-- chance for random mob respawn on a black reaver death
function event_death_complete(e)
	local chance_spawn = math.random(100);
	if(chance_spawn <= 80) then
		eq.spawn2(90012,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	else
		eq.unique_spawn(90180,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());  -- Lord_Ghiosk
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end