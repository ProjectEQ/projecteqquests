----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Vulur Stonehold (201411)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("raises a brow and gives a sneer of disdain, 'What ye want?! Can ye not see that I be a prisoner o'this place?! Or be ye as blind as ye appear dumb? Be off with ye! I be in no mood t'be taunted by the presence o'a free one and 'ave no tales o'woe an' sorrow t'share with ye! My reasons o'bein' 'ere be mine an' mine alone, y'ear?! I not be a snivlin' coward like many o'this places inmates. I 'ave no interest on dwellin' on the past. Be on yer way an' let me be!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end