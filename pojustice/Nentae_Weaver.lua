----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Nentae Weaver (201302)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("sighs, inaudibly.  'Imprisonment here is reserved for the most serious of crimes, and as such entails a virtual eternity of captivity.  You will find prisoners from all times here, held outside of time.  Were only that I still [" .. eq.say_link("corporeal") .. "] so that I could pay my penance.  In death, I am bound here forever, whereas in life at least there is hope of reprieve.");
    elseif(e.message:findi("corporeal")) then
        e.self:Say("In my life, I was a wooer of men.  I comforted them, and my arts helped me to bend their feeble, male minds to my liking.  I became overconfident.  The Arch Chancellor of the Academy was under my thrall.  His days were my possession, and his heart was in my keeping.  How [" .. eq.say_link("foolish") .. "] I was...");
    elseif(e.message:findi("foolish")) then
        e.self:Say("The meddling Dean of Incantations stumbled across me casting spells of glamor upon the Arch Chancellor.  One thing led to another and I found myself here, to stand trial for corruption of the leader of mankind's greatest ever body of scholars.'  Another sigh escapes her.  'That I could have borne, yet the fool Warden tempted me.  He took pity upon me and opened my cell, granted me [" .. eq.say_link("freedom") .. "].");
    elseif(e.message:findi("freedom")) then
        e.self:Say("I ran, being a flighty fool.  Straight into the arms of a guard at the end of the corridor.  His justice dispensed, here I am.'  Her matter-of-fact tone does not completely conceal the current of anguish that runs beneath her words.  'Here I am...  a shade, doomed to linger.");
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