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
        if (bit.band(turnins, 1024) ~= 0) then
            e.other:Message(12, "Aprilia Marrow covers her face and mumbles. 'Thank you for helping me. Please do the same for the others if you can.'")
        elseif (greatadventures > 0) then
            e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
            e.other:Message(12, "Aprilia Marrow groans softly as she turns to face you. 'Please leave me be. My darling Prathun has yet to return to me and each day weakens my resolve. I know in my heart he is out there somewhere, but with no word since the day he left, I fear that my heart may be wrong. If only I had something that would let me know what has happened to him.'")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67617})) then -- Prathun's Writings
        e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
        e.self:Say("I thought I would never have to face this reality, but here it is -- the proof I asked for. While these pages detail the adventures of my love, it is you who are the great one. While I shall forever be pained by this, I am in your debt for helping me. Please leave me now and find those others who suffer the continued disappearance of their loved ones. If you have already helped everyone, please tell De'van that your task is complete and he will reward you.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 1024)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    e.self:Say("Malt for me!  Thanks!")
end
