----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Halken Zeparr (201406)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("roars in anger!  'BEGONE!  WASTREL!  VAGABOND!  VAGRANT!  PROFLIGATE!  SCOUNDREL!  RASCAL!  WRETCH!  CAITIFF!  REPROBATE!  KNAVE!'  His tirade of insults continues as he shakes his fist at you.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end