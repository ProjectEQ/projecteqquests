-- items: 77629
function event_say(e)
    if e.message:findi("metala") then
        e.self:Emote(" lies at your feet, a bruised and bloody semblance of forgotten  lies at your feet, a bruised and bloody semblance of forgotten unable to move and twitches slightly as she continues to look up at you silently.")
    end
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)
    if qglobals["bard15"] == "5" and item_lib.check_turn_in(e.trade, {item1 = 77629}) then -- Vhalen's Necklace
        local entity_list = eq.get_entity_list()
        e.self:Emote("'s eyebrows shift into the shadow of a quizzical expression as you show her the necklace.  A flash of recognition crosses her face and she jerks back across the floor in horror.  A screeching wail tears through your mind 'You are a fool Vahlen!  You send these peasants to do your dirty work, you never were much for getting your hands dirty!  The path of pain is the only way to true power.  I will never turn from it!")
        entity_list:MessageClose(e.self, true, 120, 1, "You notice a distinct change in the air around you as something inside your packs grows hot and heavy.  Black tendrils sprout from your pack as the words of Hsagra echo in your mind.  Beware the orb!")
        entity_list:MessageClose(e.self, true, 120, 1, "Black ooze begins to float out from " .. e.other:GetName() .. "'s body and wrap around Metala's body as she twitches and spasms violently.")
        entity_list:MessageClose(e.self, true, 120, 1, "As you struggle to regain your balance and equilibrium you look on in horror as Metala's body begins to twitch and jerk.  Bones snapping and sinew stretching.  Her face seems to struggle against her bones as they contort into a horrific new visage of torment.")
        eq.spawn2(207084, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
        e.other:QuestReward(e.self, 0, 0, 0, 0, 77629, 1); -- Vhalen's Necklace
        eq.depop_with_timer()
    end
    item_lib.return_items(e.self, e.other, e.trade)
end
