----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Yventa Va`Ssula (201328)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("flicks her reptilian tongue at you as she glares at you in utter contempt. Her voice spills forward in a whispered hiss, 'What purpose have you here among us, free one? Do you find yourself pleased by the misery of the degenerate beings this place hosts? Or perhaps you are a bard and wish to spread the tales of our treachery as a lesson to the innocent? You know nothing if that is your wish here, for not all of us are victims of conscious convictions. Some, like myself, are held because of who we are in the innermost depths of our spirits -- something that we cannot help or change. We are condemned for that which we could not control in our lives. That is the true element of my fate here. If you do not understand or accept this, then perhaps you should speak with us and hear our tales. Learn before you base assumptions upon ignorance.");
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