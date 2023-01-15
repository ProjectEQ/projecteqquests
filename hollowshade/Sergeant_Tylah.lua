-- Sergeant_Tylah (166080) in Hollowshade Moor

function event_spawn(e)
    eq.signal(166257, 101) -- checks with event controller upon spawn
    quests = true;
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Good day to you " .. e.other:GetName() .. " would you happen to have any boiled rockhopper eggs for sale? I'm so very hungry and they're my favorite food.");
    end
end

function event_signal(e)
    if e.signal == 99 and e.self:GetX() < 2200 then -- abandon fort if inside
        e.self:Shout("Guards, merchants, we cannot win this battle! Grab what you can carry and retreat back to Shar Vahl! Hurry!");
        e.self:SetRunning(true);
        eq.start(99);
        quests = false;
    elseif e.signal == 100 and e.self:GetX() > 2200 then -- return to fort if outside
        eq.start(100);
        e.self:Shout("The invaders are defeated! March onward!")
    end
end

function event_waypoint_arrive(e)
    if e.wp >= 5 and e.self:GetGrid() == 99 then -- reached safe spot at ZL, set up in position
        eq.stop();
        e.self:SetRunning(false);
        eq.move_to(2637, 1226, 143.12, 180, true);
        e.self:Shout("Guard the way to Shar Vahl!  We cannot let them advance any further.")
    elseif e.wp >= 5 and e.self:GetGrid() == 100 then -- return trip finished, set up at spawn point
        eq.stop();
        eq.move_to(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH(), true);
        quests = true;
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if quests then
        if(item_lib.check_turn_in(e.trade, {item1 = 3457, item2 = 3457, item3 = 3457, item4 = 3457})) then -- 4x Boiled Rockhopper Egg
            e.self:Emote("devours all four of the eggs in the blink of an eye, 'Delicious! May the spirits bless you " .. e.other:GetName() .. "! Here are a few acrylia flakes for your trouble. I'll be happy to pay for more should you find yourself with any extra!");
            e.other:QuestReward(e.self,0,0,0,0,3459); -- Acrylia Flakes
        end
    else
        e.self:Say("Apologies my friend, I have no time to trade now. I must keep watch over the fort until this invasion is over.");
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
