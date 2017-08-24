----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Grum (201327)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 7 and e.other:GetLanguageSkill(7) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Ogre, 'Huh?'  He lifts his head and looks at you with a blank expression.  'Whoz you?  Mez not expectin visitors.  Mez in [trouble].");
        elseif(e.message:findi("trouble")) then
            e.self:Say("in Ogre, 'Ya, trouble big.  Real big dis time.  Stupid Grum, wez been told to guard some little shorty by da big man in da black robe.  Grum had to watch her during da night while the others went to make sure dat the humeyz been scared off.  But da shorty, she wuz so perdee.  So perdee...  When da otherz come back, dey found Grum.  Grum all alone with a flower behind his ear and big smilin all over.  Mez alwayz been stupid for da perdee ones.'  He looks down at something that he holds in his lap, and you notice it is a small, wilting daisy.");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    e.self:Emote("cries out, 'Guards!  Guards!");
end

function event_death_complete(e)
    e.self:Say('Justice comes to all, in time.');
end