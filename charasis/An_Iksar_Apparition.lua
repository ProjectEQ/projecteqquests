--Shaman Skull Quest 8
-- items: 30994
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 30994})) then --Iksar Relics
		eq.unique_spawn(105182,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Venril_Sathir
		eq.unique_spawn(105186,0,0,-13,-658,8,100); --an Arisen Disciple
		eq.unique_spawn(105183,0,0,13,-658,8,160); --an Arisen Priest
		eq.unique_spawn(105184,0,0,13,-690,8,228); --an Arisen Necromancer
		eq.unique_spawn(105185,0,0,-13,-690,8,34); --an Arisen Acolyte
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
