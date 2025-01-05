--#Lithiniath (NPC ID# 126208)
--Plane of Mischief 1.0

--Triggered version from quest (White Unicorn)

function event_spawn(e)
	e.self:Say("The madness has fled my mind and I am once again whole! Give Gelistial my regards, I must leave this place and try to quell the madness I have inflicted.")
end

function event_trade(e)  -- Standard Item Return Script
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end