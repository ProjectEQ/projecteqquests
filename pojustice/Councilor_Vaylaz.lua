----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Councilor Vaylaz (201317)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 13 and e.other:GetLanguageSkill(13) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Froglok, 'Frroooaaakkk!'  He jumps up upon his hind legs and stares at you with empty sockets.  'Frooooaaakkk!  Risen are we!  [Risen]!");
        elseif(e.message:findi("Risen")) then
            e.self:Say("in Froglok, 'That fool Drazl has opened the Gate and now we return from our graves, we the fallen!  Slain in battle for a war that we did not wish for!  Revenge is ours!  Now that the Gate is open, more and more of we restless ancients return to settle our score with the King!  Even Lord Gryzle returns, it is said!  Against the living kin we fight!  End up here we may, but for revenge I would give infinitely more!'  His decaying voice cackles with glee.  'Frrroooaaakkk!");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end