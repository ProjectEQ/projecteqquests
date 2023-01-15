function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("looks down, his dark eyes burrowing into yours.  'My prison is not one for casual visits, " .. e.other:Race() .. ".  What is your business here?  Do you seek an [" .. eq.say_link("audience with the Tribunal") .. "]?'");
    elseif(e.message:findi("audience with the Tribunal")) then
        e.self:Emote("nods slightly.  'You shall find them through this gateway.  I trust you shall find their knowledge vast, and their justice...' his lips curl into a sneer, 'quite fitting.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
