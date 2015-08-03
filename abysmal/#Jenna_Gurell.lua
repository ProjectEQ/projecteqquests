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
        if (bit.band(turnins, 2048) ~= 0) then
            e.other:Message(12, "Jenna Gurell stares past you as she replays a past memory in her mind. 'While I thank you for what you have done, the sight of you saddens me. Please leave me be there are others who could use your help.'")
        elseif (greatadventures > 0) then
            e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
            e.other:Message(12, "Jenna Gurell says 'Please do not disturb me. I am mourning the loss of my dear Rashere. While I do not know if his fate has yet been sealed the empty feeling in my heart tells me so. If only I could see him once more, if only I could read his words again.'")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67618})) then -- Rashere's Writings
        e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
        e.self:Emote("opens the book and begins to read from the last page aloud. As she reaches the final sentence her voice begins to crack and tears stream down her face. Wiping the tears from her face Jenna looks up at you and says 'Thank you but I really must be going. If you have done this wonderful thing for the others who have been suffering with me then return to De`van and tell him your task is complete and he will reward you.' Unable to continue she turns away from you motioning for you to leave.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 2048)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
