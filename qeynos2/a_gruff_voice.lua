--Elite_Guard_Evanet (2031)(roams north of gate) 119,635,3,259 (grid number 108)

--Elite_Guard_Drag (2126)(spawns near eastern south qeynos zoneline, paths up out past north gate and stops, paths near rogue guild) 17,-116,3,386 (grid 109)

--Elite_Guard_Jedis (2160)(stationary at 69,542, 3)

--Elite_Guard_Etter (2161)(patrol outside crow's bar, around pond, down southeast towards priest of discord, 25-30 sec pauses) 342,147,3,254 (grid 110)

--Elite_Guard_Lewot (2125)(stationary north of gate at -84, 425, 3)

--Elite_Guard_Lika (2162)(patrol outside crow's bar, around pond, down southeast towards priest of discord) 343,146,3,256 (grid 111)

--Elite_Guard_Sarve (2128)(patrol outside crow's bar, around pond, down southeast towards priest of discord) 203,16,2,506 (grid 112)

--Elite_Guard_Aterbome (2129)(patrol inside monk guild, will walk out onto ramp near pond and stop, return inside monk guild, walks out near togahn sorast and pauses) 293,286,17,253 (grid 113)

--Elite_Guard_Inski (2130)(spawns outside gate to the west , static)

--Elite_Guard_Vaughn (2132)(patrol first room in crows bar, paths outside right in front of crows bar and stops, goes back in after 30s) 358,78,3,477 (grid 114)


local event_started = 0;

function event_spawn(e)
event_started = 0;
end

function event_signal(e)
    if e.signal == 1 and event_started == 0 then
        event_started = 1;
        --do things
        eq.zone_emote(0, "a gruff voice shouts, 'Stay alert, men. Word is that the package will be delivered shortly.The smuggler is likely already here.");
        eq.unique_spawn(2031, 108, 0, 119, 635, 3, 259);
        eq.unique_spawn(2126, 109, 0, 17, -116, 3, 386);
        eq.unique_spawn(2160, 0, 0, 69, 542, 3, 0);
        eq.unique_spawn(2161, 110, 0, 342, 147, 3, 254);
        eq.unique_spawn(2125, 0, 0, -84, 425, 3, 259);
        eq.unique_spawn(2162, 111, 0, 343, 146, 3, 259);
        eq.unique_spawn(2128, 112, 0, 203, 16, 3, 506);
        eq.unique_spawn(2129, 113, 0, 293,286,17,253);
        eq.unique_spawn(2130, 0, 0, 326, 422, 3, 414);
        eq.unique_spawn(2132, 114, 0, 358, 78, 3, 477);

        eq.set_timer("fail", 7200 * 1000); -- half an hour? so far over 1 hour and no fail
    elseif e.signal == 2 and event_started == 1 then
        --signal win from turn in. depop event
        eq.stop_timer("fail");
        eq.depop(2031);
        eq.depop(2126);
        eq.depop(2160);
        eq.depop(2161);
        eq.depop(2125);
        eq.depop(2162);
        eq.depop(2128);
        eq.depop(2129);
        eq.depop(2130);
        eq.depop(2132);

        eq.depop_with_timer(); --depop self to reset event
    end
end

function event_timer(e)
    if e.timer == "fail" then
        eq.stop_timer("fail");
        eq.depop(2031);
        eq.depop(2126);
        eq.depop(2160);
        eq.depop(2161);
        eq.depop(2125);
        eq.depop(2162);
        eq.depop(2128);
        eq.depop(2129);
        eq.depop(2130);
        eq.depop(2132);
        

        eq.depop_with_timer(); --depop self to reset event

    end
end