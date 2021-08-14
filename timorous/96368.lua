function event_spawn(e)
    eq.set_next_hp_event(90);
end

function event_combat(e)
    if (e.joined == true) then
        eq.stop_timer("depop");
    else
        eq.set_timer("depop", 1800000) -- 30 mins
    end
end

function event_hp(e)
    if (e.hp_event == 90) then
        e.self:TempName("Zordak Ragefire");
        e.self:Say("Now you will see the name that will burn Norrath!")
        e.self:CastSpell(2046, e.self:GetID()); -- Deathly Chants
        eq.set_timer("deathlychants", 18000);
        eq.set_next_hp_event(85);
    elseif (e.hp_event == 85) then
        e.self:Say("You fight well, but behold my true form and my true power!");
        e.self:SendIllusionPacket({race=19,gender=2,texture=0,helmtexture=0,size=20});
        eq.set_timer("lavabreath_start", 40000);
        eq.set_next_hp_event(60);
    elseif (e.hp_event == 60) then
        e.self:Say("Do not think it will be so easy this time!");
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        e.self:CastSpell(5554, e.self:GetID()); -- Cloud of Discord
        eq.set_timer("cloudofdiscord", 90000);
        eq.set_next_hp_event(30);
    elseif (e.hp_event == 30) then
        e.self:Say("Fools! My power is more than you can ever imagine!  Fear me!");
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        e.self:CastSpell(5163, e.self:GetID()); -- Force Breath
        eq.set_timer("forcebreath", 20000);
        e.self:CastSpell(3070, e.self:GetID()); -- Timeless Panic
        eq.set_timer("timelesspanic", 42000);
        eq.set_next_hp_event(25);
    elseif (e.hp_event == 25) then
        e.self:CastedSpellFinished(4746, e.self); -- Protection of Discord III
        e.self:CastedSpellFinished(1248, e.self); -- Spiritual Echo
        e.self:Say("This will not end here!  I have power left to destroy you all!");
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
        eq.spawn2(96369, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Zordak`s_Minion
    end
end

function event_timer(e)
    if (e.timer == "lavabreath_start") then
        e.self:SpellFinished(5762, e.self:GetTarget()); -- Lava Breath
        eq.stop_timer("lavabreath_start");
        eq.set_timer("lavabreath", 45000);
    elseif (e.timer == "lavabreath") then
        e.self:SpellFinished(5762, e.self:GetTarget()); -- Lava Breath
    elseif (e.timer == "deathlychants") then
        e.self:CastSpell(2046, e.self:GetID()); -- Deathly Chants
    elseif (e.timer == "cloudofdiscord") then
        e.self:CastSpell(5554, e.self:GetID()); -- Cloud of Discord
    elseif (e.timer == "forcebreath") then
        e.self:CastSpell(5163, e.self:GetID()); -- Force Breath
    elseif (e.timer == "timelesspanic") then
        e.self:CastSpell(3070, e.self:GetID()); -- Timeless Panic
    elseif (e.timer == "depop") then
        eq.depop_all(96369);
        eq.depop();
    end
end

