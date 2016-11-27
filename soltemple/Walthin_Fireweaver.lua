-- Quests for Bard Lambent Armor

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Good day to you!  I am Walthin Fireweaver of the League of Antonican Bards.  My friend Cryssia and I are here while we deal in [" .. eq.say_link("lambent stones") .. "] with the followers of Solusek Ro.  If you are interested, Cryssia and I also deal in [" .. eq.say_link("lambent armor") .. "], the perfect armor for a bard of standing.  I also dabble in some research from time to time.  I'm a bit of a historian.  I study the history of [" .. eq.say_link("dragons") .. "].")
    elseif e.message:findi("dragons") then
        e.self:Say("I'm utterly fascinated by all things draconic.  There are many tomes in the temple's libraries that catalog much of their species' history.  Some day I'll have to travel to the frozen land of Velious and see what other secrets I can learn there.")
    elseif e.message:findi("lambent armor") then
        e.self:Say("Lambent armor is custom-crafted armor, made especially for bards. It is forged by the MeadowGreen brothers and then enchanted by the followers of Solusek Ro. If you are interested, I can tell you about [" .. eq.say_link("lambent gauntlets") .. "], [" .. eq.say_link("lambent greaves") .. "] and [" .. eq.say_link("lambent boots") .. "]. Cryssia can tell you about other lambent armor.")
    elseif e.message:findi("lambent gauntlets") then
        e.self:Say("Alright, I need you to retrieve for me some Black Silk Gloves, a Lambent Star Ruby, and Shin Gauntlets. Return to me with these and I will craft your gauntlets.")
    elseif e.message:findi("lambent greaves") then
        e.self:Say("Very well, return to me with these items and I will craft them. A set of Icy Greaves, a Lambent Fire Opal, and Shin Greaves.")
    elseif e.message:findi("lambent boots") then
        e.self:Say("Alright, I will require some items. Go and get me some Firewalker Boots, a Lambent Sapphire, and the middle piece of the Rune of the One Eye. Return to me with these items and I will craft your boots.")
    end
end

function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2318, item2 = 10119, item3 = 10561})) then
        e.self:Say("Excellent. Here are your Lambent Boots.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4159,1000); --boots
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2319, item2 = 10117, item3 = 4114})) then
        e.self:Say("Excellent. Here are your Lambent Gauntlets.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4157,1000); --gauntlets
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4115, item2 = 10128, item3 = 4116})) then
        e.self:Say("Excellent. Here are your Lambent Greaves.");
        e.other:Faction(320,5);        -- Temple of Solusek Ro better
        e.other:Faction(291,-5);       -- Shadow Men worse
        e.other:QuestReward(e.self,0,0,0,0,4158,1000); --greaves
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

