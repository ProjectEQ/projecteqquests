-- Guild Hall Regen Pool Script - NPC Portion

-- Set the distance for the proximity here
local ProxDist = 30

function event_spawn(e)
    local xloc = e.self:GetX()
    local yloc = e.self:GetY()
    local zloc = e.self:GetZ()
    eq.set_proximity(xloc - ProxDist, xloc + ProxDist, yloc - ProxDist, yloc + ProxDist, zloc - ProxDist, zloc + ProxDist)
end

function event_enter(e)
    e.other:EnableAreaRegens(2000)
    e.other:SendColoredText(0, "You are filled with new energy as you near the healing pool.")
    e.other:AddNimbusEffect(412)
end

function event_exit(e)
    e.other:DisableAreaRegens()
    e.other:SendColoredText(0, "The energy fades away as you leave the healing pool.")
    e.other:RemoveNimbusEffect(412)
end

function event_trade(e)
    local item_lib = require("items")
    item_lib.return_items(e.self, e.other, e.trade)
end

