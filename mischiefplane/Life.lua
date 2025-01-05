--Life 
--Plane of Mischief 1.0

function event_say(e)
	e.self:Shout("SILENCE IN THE LIBRARY!"); 
	e.self:SpellFinished(982, e.other);  --cast Cazic Touch (10K unresistable dmg)
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

