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
        if (bit.band(turnins, 256) ~= 0) then
            e.other:Message(12, "Sophia Florence says 'Thank you again for what you have done, I will forever be in your debt.'")
        elseif (greatadventures > 0) then
            e.self:Emote(" focuses her attention on " .. e.other:GetName() .. ".")
            e.other:Message(12, "Sophia Florence wipes away a tear as she turns to face you. Hello, " .. e.other:GetName() .. ", sorry if I seem somewhat antisocial but it has been many days since I last saw my father Lyndro and as each hour passes the possibility that he may never return becomes more apparent. While I have not given up hope it gets harder each day not to. If he is never to return to me I wish that I had something to remember him by, something that let me know he died just as brave a man as he has always been.")
        end
    end
end

function event_trade(e)
    local item_lib = require("items")
    local turnins = 0
    if (e.other:GetGlobal("greatadventuresturnins") ~= "Undefined") then
        turnins = tonumber(e.other:GetGlobal("greatadventuresturnins"))
    end
    if (item_lib.check_turn_in(e.trade, {item1 = 67615})) then -- Lyndro's Writings
        e.self:Emote("takes the dusty tome from " .. e.other:GetName() .. "'s hands.")
        e.self:Emote("eyes open wide as she takes the journal and runs her hands over the front cover. Opening the book to the last page tears begin to roll down her cheeks and land on the parchment. Finishing the last line Sophia looks up to you and says, 'I don't know what to say but thank you. De'van mentioned that he had told someone of my worries and now here you are with the final writings of my father. You are truly a blessing sent by the Gods and I thank you once again, but I must ask that you do the same for the others who are worried about the loved ones that traveled with my father.  If you have already helped everyone please tell De'van that your task is complete and he will reward you.")
        e.other:SetGlobal("greatadventuresturnins", tostring(bit.bor(turnins, 256)), 5, "F")
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    e.self:Emote("smiles and happily exclaims, 'I want to taste my drink!  I want something with flavor.  I'll 'ave a nice dark ale, my dear!'")
end
