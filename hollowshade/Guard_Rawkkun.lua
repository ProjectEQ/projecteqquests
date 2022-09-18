-- Guard_Rawkkun (166079) in Hollowshade Moor

function event_spawn(e)
    eq.signal(166257, 101) -- checks with event controller upon spawn
    quests = true;
end

function event_signal(e)
    if e.signal == 99 and e.self:GetX() < 2200 then -- abandon fort if inside
        e.self:Say("We better get the merchants out of here!");
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
        eq.move_to(2650, 1255, 143.12, 180, true);
    elseif e.wp >= 5 and e.self:GetGrid() == 100 then -- return trip finished, set up at spawn point
        eq.stop();
        eq.move_to(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH(), true);
        quests = true;
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if quests then
        if item_lib.check_turn_in(e.trade, {item1 = 6220}) then -- Daily Status Report (2)
            e.self:Emote("yells, 'Head count! Head count time!' A moment later he says 'I'm pretty sure that they're all here. Just take this back and act like your didn't just see that.' He winks and hands you the report.");
            e.other:Faction( 132,10 ); -- Guardians of Shar Vahl
            e.other:QuestReward(e.self,0,0,0,0,6221,1000); -- Daily Status Report (3)
        end
    else
        e.self:Say("Apologies my friend, I have no time to trade now. I must keep watch over the fort until this invasion is over.");
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
