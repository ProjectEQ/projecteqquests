-- Kerr_Tiparr (166083) in Hollowshade Moor

function event_spawn(e)
    eq.signal(166257, 101) -- checks with event controller upon spawn
    quests = true;
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Welcome to our humble outpost, traveller. Let me know if you see anything you need. I consider it an honor to sell here, for doing so enables Vah Shir in training to stay in the field.");
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
        eq.move_to(2722, 1172, 135, 220, true);
    elseif e.wp >= 5 and e.self:GetGrid() == 100 then -- return trip finished, set up at spawn point
        eq.stop();
        eq.move_to(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH(), true);
        quests = true;
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if quests then
        if(item_lib.check_turn_in(e.trade, {item1 = 5566})) then -- Pot of Spicy Fish Stew
            e.self:Say("Thanks " .. e.other:GetName() .. "! That was delicious. Here is the empty bowl.");
            e.other:QuestReward(e.self,0,0,4,0,5567); -- Empty Stew Bowl
        end
    else
        e.self:Say("Apologies my friend, this will have to wait until we are able to return to the fort.");
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
