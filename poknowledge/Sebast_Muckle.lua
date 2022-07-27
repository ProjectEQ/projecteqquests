-- items: 47100, 61025
function event_say(e)
    if (e.message:findi("hail")) then
        e.self:Say("Hello there. Can I be of service for anything?");
    end
end

function event_trade(e)
    local item_lib = require("items");
    local qglobals = eq.get_qglobals(e.other)

    if (qglobals["mnk_epic20"] == "6" and item_lib.check_turn_in(e.trade, {item1 = 47100, item2 = 61025})) then
        e.other:AddAAPoints(10);
        e.other:Message(15, "You have gained 10 ability point(s)!")
        e.self:Say("I see you have found a way to bring order and balance back to the world. You should have also learned of the need for such evils in the world. There cannot be good without evil just as there cannot be truth without deception. I will take the discordant globe now with your fistwraps and make something wonderful for you from them. They will help guide you through the most difficult of times as a reminder of the knowledge you now possess for without the balance between good and evil we are but lost.");
        e.other:QuestReward(e.self, 0, 0, 0, 0, 67742, 1000); -- Transcended Fistwraps of Immortality
    end

    item_lib.return_items(e.self, e.other, e.trade);
end

