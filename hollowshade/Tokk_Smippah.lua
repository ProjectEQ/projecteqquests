-- Tokk_Smippah (166082) in Hollowshade Moor

function event_spawn(e)
    eq.signal(166257, 101) -- checks with event controller upon spawn
    quests = true;
    eq.set_timer('idle_chat', math.random(10, 60) * 60 * 1000);
end

function event_timer(e)
    eq.stop_timer(e.timer);
    if e.timer == 'idle_chat' then
        e.self:Say("What in the realm is that smell? If I find out who's feeding the sergeant those eggs, I'll make them stand here and endure the aftermath!");
        eq.set_timer('idle_chat', math.random(10, 60) * 60 * 1000);
    end
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Tokk. perhaps you've heard of me? I'd be out in the forest aiding in the war if it weren't for some nasty wounds I took from the grunts. I'm working here as a merchant until they heal. then it's back to the fray. I'll be back out there soon. perhaps we'll raid a grimling camp together.");
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
        eq.move_to(2722, 1285, 134, 170, true);
    elseif e.wp >= 5 and e.self:GetGrid() == 100 then -- return trip finished, set up at spawn point
        eq.stop();
        eq.move_to(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH(), true);
        quests = true;
    end
end

function event_trade(e)
    local item_lib = require("items");   
    item_lib.return_items(e.self, e.other, e.trade)
end
