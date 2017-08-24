----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Zemlan Blackfang (201381)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 15 and e.other:GetLanguageSkill(15) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Gnoll, 'Gah!'  He spits upon the floor.  'What manner of fool is Opolla to talk to me?  Leniency...  excess leniency indeed, what foul rot spews from that mouth.  As gaoler to the Infected Paw itself, is it not up to me to determine [imprisonment]?");
        elseif(e.message:findi("imprisonment")) then
            e.self:Say("in Gnoll, 'Foul that the gaoler ends up in the gaol, is it not?'  He emits a mirthless laugh.  'Captured, was the Grand Shaman.  Thrown into my gaol, under my custody.  Served him, did I, in his rule.  So serve him, would I, in his capture.  His escape...   these things happen.'  His eyes look as if they have something to hide.  'Bah...  here is my repayment.  Repayment for years of service...");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end