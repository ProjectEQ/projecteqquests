----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Shera Banneth (201345)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("I dun wanna talk to anyone, go away! Dun ask me [" .. eq.say_link("why") .. "]!");
    elseif(e.message:findi("why")) then
        e.self:Say("My you are dense?  Well I canna say I dinna expect it from a " .. e.other:Race() .. ".  Aren't you afraid you are goinna end up like my [" .. eq.say_link("husband") .. "]?");
    elseif(e.message:findi("husband")) then
        e.self:Say("My husband was Suili Banneth.  He was a foul drunk of the worst sorts, never an 'onest day o' work in his life.  Well I found a man worth my time so a lil hemlock in Suili's ale at night an he dinna wake up.  I guess his family was upset aboot tha, so they petitioned ta sen' me 'ere.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end