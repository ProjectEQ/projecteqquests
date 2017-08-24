----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Drazl (201304)
----------------------------------------------------------------------

function event_say(e)
    if(e.language == 13 and e.other:GetLanguageSkill(13) >= 100) then
        if(e.message:findi("Hail")) then
            e.self:Say("in Froglok, 'Well ventured, ".. e.other:GetName() .. ".  You seem afraid...  I assure you, there is no need.  Drazl may have been bad once, but no more.  No more badness.  You seem far too nice, far too nice by far.  Drazl wouldn't harm a fly.  Not a hair on your dainty head.  Not any more.  [Those days] have long gone.");
        elseif(e.message:findi("Those days")) then
            e.self:Say("in Froglok, 'The fools that follow the King so blindly...   they will soon see!  Though I may be captive, here, my work shall go on!  My peers are working even now on raising our army...  raising our army from the grave!  So comfortably, he sits, the King.  So comfortably, his [revolution] but a memory.  Soon, he shall be less smug, it is my guarantee.");
        elseif(e.message:findi("revolution")) then
            e.self:Say("in Froglok, 'His has not always been in a position of power, but when the revolutions come the mob will blindly follow any fool.  Fool, I say!  None more foolish than King Dergzl.  His power seized when the masses overthrew their masters...  he shall soon know the feeling.  When the [wheels] that I have set in motion finish their turning, he shall know!");
        elseif(e.message:findi("wheels")) then
            e.self:Say("in Froglok, 'There are those amongst his... subjects - gah, how I hate that word! - who cannot stand his suffocating and absolute rule.  We brave few, we brave and daring few...   we seem so small in numbers, but we have the biggest [resource] of all from which to draw our armies.");
        elseif(e.message:findi("resource")) then
            e.self:Say("in Froglok, 'Why, the grave itself!  My colleagues have made certain pacts and bargains.   I wish only that I could see it with my own eyes.  Such is my real punishment, that I cannot see the imminent downfall of Dergzl when the armies formed of his revived ancestors come to slay him and throw him from his throne.  Instead... instead, here I rot.  Not bad any more.  Not bad at all, am I.  Merely disappointed that when the forces of undeath come, I shall not be there to lead them.  Lead them to a new Guk, a free Guk!");
        end
    else
        e.self:Emote('does not appear to understand you.');
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end