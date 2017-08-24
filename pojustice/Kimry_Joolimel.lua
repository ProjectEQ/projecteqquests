----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Kimry Joolimel (201363)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 8 and e.other:GetLanguageSkill(8) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Gnomish, 'Hi there!'  Her radiant smile seems too quick and shallow, you wonder what she wants from you.  'Tell me, what's a nice " .. e.other:Race() .. " doing in such a foul place such as this?  Have you been...'  She makes a motion with her hand as if raising an invisible glass to her anxious lips.  'Partaking of the [finer things] in life, too?'");
        elseif(e.message:findi("finer things")) then
            e.self:Say("in Gnomish, 'Mmmm!'  She broadens her smile, until she appears to be nearly all teeth.  You ponder just how wide a gnome can grin.  'A little of the old Spirits, eh?  I'm not talking about those boring ghosts that flit back and forth around these parts, wailing all night, either!  Have you got some of the [good stuff] for me?  Have you?  Come on, Kimry knows you have.");
        elseif(e.message:findi("good stuff")) then
            e.self:Say("in Gnomish, 'Come on!'  She smiles yet wider from her place on the bed as her hands begin to tremble.  'Don't hold out on me now, I know you've got some there!  Just a little sip, that's all I ask.  What harm can it do?  I'm already here, so it cannot get any worse!  Come on, just give mother what she wants...   Just a little sip is all!");
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