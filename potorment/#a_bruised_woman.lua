function event_say(e)
    if e.message:findi("metala") then
        e.self:Emote(" lies at your feet, a bruised and bloody semblance of forgotten  lies at your feet, a bruised and bloody semblance of forgotten unable to move and twitches slightly as she continues to look up at you silently.")
    end
end

function event_trade(e)
    local item_lib = require("items")
    item_lib.return_items(e.self, e.other, e.trade)
end
