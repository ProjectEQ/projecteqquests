-- Rittuh_Purrik (166081) in Hollowshade Moor

function event_spawn(e)
    eq.signal(166257, 101) -- checks with event controller upon spawn
    quests = true;
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Good day " .. e.other:GetName() .. " or is it evening already? I can never tell. Stock up on goods while you're here and if you see any grimlings, please make them suffer. My husband was tortured by the grunts in the forest.");
    end
end

function event_signal(e)
    if e.signal == 99 and e.self:GetX() < 2200 then -- abandon fort if inside
        e.self:SetRunning(true);
        eq.start(99);
        quests = false;
    elseif e.signal == 100 and e.self:GetX() > 2200 then -- return to fort if outside
        eq.start(100);
    end
end

function event_waypoint_arrive(e)
    if e.wp >= 5 and e.self:GetGrid() == 99 then -- reached safe spot at ZL, set up in position
        eq.stop();
        e.self:SetRunning(false);
        eq.move_to(2680, 1171, 134, 240, true);
    elseif e.wp >= 5 and e.self:GetGrid() == 100 then -- return trip finished, set up at spawn point
        eq.stop();
        eq.move_to(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH(), true);
        quests = true;
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if quests then
        if(item_lib.check_turn_in(e.trade, {item1 = 5573})) then -- A Folded Note
            e.self:Say("Come to do some work, " .. e.other:GetName() .. "?  Looks like you need to gather some rockhopper tails.  Take this backpack and fill it up.");
            e.other:QuestReward(e.self,0,0,0,0,17609); -- Rough Leather Backpack
        elseif(item_lib.check_turn_in(e.trade, {item1 = 5582})) then -- Bag of Tails
            e.self:Say("Well, look at you! You're quite the hunter. Not a bad job at all, young citizen. We can sure use a few more like you. I think a little padding of your daily report is in order considering the amount of work that you've done for us. Take this back to citizen Miann. She'll be pleased with you. I wrote it up pretty nice for you. Take care and good luck with your training.");
            e.other:Faction(132,5); -- Guardians of Shar Vahl
            e.other:QuestReward(e.self,0,0,0,0,5577);
        end
    else
        e.self:Say("Apologies my friend, this will have to wait until we are able to return to the fort.");
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
