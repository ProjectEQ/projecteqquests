----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Commander Ralinor (201398)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("stands defiant before you.  'Military courts be damned, this crazed asylum is not a fitting place for the trial of a man who has proved himself honorable in endless wars, battles without number, all for the safety of his people.  Fed on crusts of stale bread, all covered in mould.  Blasted things are filled with weevils sometimes.  You look as if you've seen your fair share of fights; are you a [" .. eq.say_link("militarian") .. "] too?");
    elseif(e.message:findi("militarian")) then
        e.self:Say("One can always tell.  It's something in the eyes.  I hope only, for your sake, that the people you serve grant you more than the people I served granted me.  Unless you consider winding up here as adequate recompense.'  He paces back and forth.   'There are rumors of [" .. eq.say_link("tunnels") .. "]... methods of escape.  If you find out about them, come to me immediately.  I can stomach this imprisonment no longer.");
    elseif(e.message:findi("tunnels")) then
        e.self:Emote("sighs in resignation.  'What am I thinking...  I will see this through to the end.  If I turn tail and flee, I have lowered myself to that of the cowards that saw fit to send me here for trial of crimes which I did not commit.'  He raises his head and you feel inspired by his strength.  'I'll face the music, even if it not of my own tune.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end