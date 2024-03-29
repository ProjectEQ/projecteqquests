function event_spawn(e)
	local x = e.self:GetX();
	local y = e.self:GetY();
	eq.set_proximity(x - 120, x + 120, y - 120, y + 120);
end

function event_enter(e)
	e.other:SetGlobal("spire_dreadlands", "1", 1, "F");
end

function event_exit(e)
	e.self:SetGlobal("spire_dreadlands", "0", 1, "F");
end

function event_signal(e)
	if e.signal == 101 then
		e.self:CastSpell(2935, 86051); -- Journey: Luclin
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end