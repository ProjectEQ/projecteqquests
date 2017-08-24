----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Master Vhezar (201378)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 18 and e.other:GetLanguageSkill(18) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Lizardman, 'Hail.'  He holds your gaze.  'Peace be with you, ".. e.other:GetName() .. ".  You appear unrestful, this is good.  Unrest makes one attentive.  Focused.  Alert.  You will need the sum total of your wits at your command if you are to not fall to the [forces] at work in this place of imprisonment.");
        elseif(e.message:findi("forces")) then
            e.self:Say("in Lizardman, 'There are many.  The representatives of True Justice hold sway here, and the task of dispensing judgments falls upon them.  I have heard that the Warden...'  He looks out to see if he is being overheard.  'I have heard that the Warden has his own thoughts on justice, however.  Then, there are we [prisoners].");
        elseif(e.message:findi("prisoners")) then
            e.self:Say("in Lizardman, 'From those with whom I have talked, it seems that we have little in common save that we have all been accused of the most serious of crimes.  The definition of serious seems to vary according to the background of the prisoner, though.  I overheard a conversation of a dwarf claiming that she was sent here for overcharging on goods that she sold, for example.'  He shakes his head and looks resigned to a long fate.  I have [faith].");
        elseif(e.message:findi("faith")) then
            e.self:Say("in Lizardman, 'As a Grandmaster, my life is one of pure worship.  In the worship of the Great Fearsome, so I go about my days.  My faith shall not let me down, of this I have no doubt.  Even in the face of great accusation, I shall remain true to the one, real god.'  He adjusts his wristband and glances at you from the corner of one eye.  'That god is Cazic-Thule, mark you, " .. e.other:Race() .. ".");
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