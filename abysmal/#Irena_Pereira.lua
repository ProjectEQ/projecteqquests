-- The Fourteen Great Adventurers: http://everquest.allakhazam.com/db/quest.html?quest=2854
function event_say(e)
    local greatadventures = 0
    if (e.other:GetGlobal("greatadventures") ~= "Undefined") then
        greatadventures = tonumber(e.other:GetGlobal("greatadventures"))
    end
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (e.message:findi("hail")) then
        if (bit.band(turnins, 8192) ~= 0) then
            e.other:Message(12, "Irena Pereira says 'From one warrior to another, thanks for what you did. Absor's memory will live on with me.'")
        elseif (greatadventures > 0) then
            e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
            e.other:Message(12, "Irena Pereira says 'You must be the one De'van spoke to.  I'm not looking for any of your help. I know that the mighty Absor will return someday and until I am proven wrong I will continue to wait for him to arrive.'")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67620})) then -- Absor's Writings
        e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
        e.self:Emote("stops to look at the tome refusing to believe it is what it seems. As she leafs through each page she starts to get choked up. Slamming the book closed defying her want to shed tears she looks up at you and kneels. I thank thee mighty adventurer for helping place the spirit of Absor to rest.  If you have already helped everyone please tell De'van that your task is complete and he will reward you.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 8192)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
