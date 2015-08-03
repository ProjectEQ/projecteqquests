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
        if (bit.band(turnins, 512) ~= 0) then
            e.other:Message(12, "Verna Abella says 'Your kindness is truly wonderful. Thank you for helping place him to rest.'")
        elseif (greatadventures > 0) then
            e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
            e.other:Message(12, "Verna Abella seems to be deep in thought. She ignores you at first but eventually turns towards you with a somber look on her face. 'Forgive me. I am not much of a talker these days since Silius left on his journey with Lyndro and the others. Sitting here everyday wishing that they would return has consumed me to the point that I can do nothing else. If only I had some proof of what has happened to Silius. Anything at all would help me in this time of wonder and worry.'")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67616})) then -- Silius' Writings
        e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
        e.self:Emote("takes the book from your hands instantly recognizing it. 'Does this mean he is...' She stops for a second choking back tears as the reality of Silius' passing hits her. 'I thank you for bringing this to me I shall cherish it always. Please help the others who have been suffering like me, bring them the closure you have given to me so that they can get on with their lives. Forgive me but I must be going there is much I must do.  If you have already helped everyone please tell De'van that your task is complete and he will reward you.'")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 512)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_singal(e)
    e.self:Say("Well, don't ye look lovely today! Why, I can 'ardly think of what I want ta drink with ye distractin' me. 'ow about a light beer for now. I'll surely be orderin' more as long as yer on duty!")
end
