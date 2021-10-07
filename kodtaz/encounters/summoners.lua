-- summoners ring rewrite by Huffin
-- NPC: #Pixtt_Grand_Summoner 293212
-- NPC: #Pixtt_Priest_Summoner 293213
-- #Trigger_Kodtaz_1 (293218) 
-- NPC: #Deranged_Lesser_Stoneservant 293215
-- NPC: #Deranged_Greater_Stoneservant 293216
--#leash (293001)
--#Hexxt_Chaos_Provoker (293214)

local respawn = 0;

function Trigger_Spawn(e)
eq.set_timer("popevent",3000);
respawn = 0;
end

function Trigger_Timer(e)
    if (e.timer == "popevent") then
        eq.stop_timer("popevent");
        eq.unique_spawn(293212, 0, 0, 591, 746, -460, 150); -- NPC: #Pixtt_Grand_Summoner
        -- Spawn 293213 Pixtt Priest Summoners
        eq.spawn2(293213, 0, 0, 613, 789, -450, 188); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 692, 810, -456, 344); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 725, 770, -460, 324); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 717, 690, -449, 480); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 596, 703, -456, 88); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 651, 815, -460, 226); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 740, 723, -456, 440); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 677, 669, -451, 488); -- NPC: #Pixtt_Priest_Summoner
        eq.spawn2(293213, 0, 0, 623, 672, -460, 28); -- NPC: #Pixtt_Priest_Summoner
        eq.unique_spawn(293001, 0, 0, 663, 739, -460, 0); --npc #leash (293001)
    end
end

function Priest_Death(e)
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(293213) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293212) == true) then
    --if all 9 priest summoners dead and grand summoner alive, start next phase
        eq.signal(293212,1); --signal to start next phase
    end
end

function Grand_Signal(e)
    if (e.signal == 1) then
    -- Spawn Deranged Lesser Stoneservants
        eq.spawn2(293215,0,0,611,683,-460,64); -- NPC: #Deranged_Lesser_Stoneservant
        eq.spawn2(293215,0,0,589,771,-459,176); -- NPC: #Deranged_Lesser_Stoneservant
        eq.spawn2(293215,0,0,673,821,-460,266); -- NPC: #Deranged_Lesser_Stoneservant
    -- Spawn Deranged Greater Stoneservants
        eq.spawn2(293216,0,0,581,723,-460,118); -- NPC: #Deranged_Greater_Stoneservant
        eq.spawn2(293216,0,0,617,806,-449,206); -- NPC: #Deranged_Greater_Stoneservant
        eq.spawn2(293216,0,0,720,803,-460,300); -- NPC: #Deranged_Greater_Stoneservant
    elseif (e.signal == 2) then
    --reduce hp by 8 %
        if (e.self:GetHPRatio() > 10) then
            local hp1 = e.self:GetMaxHP() * .08;
            e.self:SetHP( e.self:GetHP() - hp1 );
            eq.spawn2(eq.ChooseRandom(293215,293216),0,0,657 + math.random(-20,20),737 + math.random(-20,20),-455,276); -- choose random golem
        else
            respawn = 1; --stop respawning adds
        end
    elseif (e.signal == 3) then
    --reduce hp by 2 %
        if (e.self:GetHPRatio() > 10) then
            local hp2 = e.self:GetMaxHP() * .02;
            e.self:SetHP( e.self:GetHP() - hp2 );
            eq.spawn2(eq.ChooseRandom(293215,293216),0,0,657 + math.random(-20,20),737 + math.random(-20,20),-455,276); -- choose random golem
        else
            respawn = 1; --stop respawning adds
        end
    elseif (e.signal == 4) then
        e.self:SetSpecialAbility(35, 0); --turn off immunity
        e.self:SetSpecialAbility(24, 0); --turn off anti aggro
    end
end


function Grand_Death(e)
eq.unique_spawn(293214,0,0,684,719,-460,450); -- NPC: #Hexxt_Chaos_Provoker
eq.depop_with_timer(293218); -- #Trigger_Kodtaz_1 (293218) assuming event doesnt reset, use this npc to control respawn of event
end

function Grand_Spawn(e)
eq.set_timer("energysiphon", 60 * 1000);
end

function Grand_Timer(e)
e.self:CastSpell(5071,e.self:GetID()); --energy siphon
end

function Provoker_Death(e)
eq.spawn2(293217,0,0,611,683,-460,64); -- NPC: #Deranged_Supreme_Stoneservant
eq.spawn2(293217,0,0,589,771,-459,176); -- NPC: #Deranged_Supreme_Stoneservant
eq.spawn2(293217,0,0,673,821,-460,266); -- NPC: #Deranged_Supreme_Stoneservant
eq.spawn2(293217,0,0,750,754,-460,360); -- NPC: #Deranged_Supreme_Stoneservant
eq.spawn2(293217,0,0,705,668,-453,468); -- NPC: #Deranged_Supreme_Stoneservant
eq.spawn2(293217,0,0,705,668,-453,468); -- NPC: #Deranged_Supreme_Stoneservant
end

function Provoker_Combat(e)
    if (e.joined == true) then
        eq.set_timer("oobcheck", 5 * 1000);
    else
        eq.stop_timer("oobcheck");
    end
end

function Provoker_Timer(e)
    if (e.timer == "oobcheck") then
    local npc1 = eq.get_entity_list():GetMobByNpcTypeID(293001);
        -- calc distance to leash npc in center of ring
        if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) > 150) then
            e.self:SetHP(e.self:GetMaxHP())
            e.self:CastSpell(3791, e.self:GetID())
            e.self:WipeHateList()
        end
    end
end

function Lesser_Combat(e)
    if (e.joined == true) then
        eq.set_timer("oobcheck", 5 * 1000);
    else
        eq.stop_timer("oobcheck");
    end
end

function Lesser_Timer(e)
    if (e.timer == "oobcheck") then
    local npc1 = eq.get_entity_list():GetMobByNpcTypeID(293001);
        -- calc distance to leash npc in center of ring
        if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) > 150) then
        e.self:SetHP(e.self:GetMaxHP())
        e.self:CastSpell(3791, e.self:GetID())
        e.self:WipeHateList()
        end
    end
end


function Greater_Combat(e)
    if (e.joined == true) then
        eq.set_timer("oobcheck", 5 * 1000);
    else
        eq.stop_timer("oobcheck");
    end
end

function Greater_Timer(e)
    if (e.timer == "oobcheck") then
    local npc1 = eq.get_entity_list():GetMobByNpcTypeID(293001);
        -- calc distance to leash npc in center of ring
        if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) > 150) then
            e.self:SetHP(e.self:GetMaxHP())
            e.self:CastSpell(3791, e.self:GetID())
            e.self:WipeHateList()
        end
    end
end

function Deranged_Combat(e)
    if (e.joined == true) then
        eq.set_timer("oobcheck", 5 * 1000);
    else
        eq.stop_timer("oobcheck");
    end
end

function Deranged_Timer(e)
    if (e.timer == "oobcheck") then
    local npc1 = eq.get_entity_list():GetMobByNpcTypeID(293001);
        -- calc distance to leash npc in center of ring
        if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) > 150) then
            e.self:SetHP(e.self:GetMaxHP())
            e.self:CastSpell(3791, e.self:GetID())
            e.self:WipeHateList()
        end
    end
end



function Lesser_Death(e)
    if respawn == 0 then
        eq.signal(293212,3);
    end
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(293215) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293216) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293122) == true) then
        --all lessers and greaters are down, grand summoner still alive
        eq.signal(293212,4);
    end
end

function Greater_Death(e)
    if respawn == 0 then
        eq.signal(293212,2);
    end
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(293215) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293216) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293122) == true) then
        --all lessers and greaters are down, grand summoner still alive
        eq.signal(293212,4);
    end
end


function event_encounter_load(e)
eq.register_npc_event('summoners', Event.spawn, 293218, Trigger_Spawn);
eq.register_npc_event('summoners', Event.timer, 293218, Trigger_Timer);
    
eq.register_npc_event('summoners', Event.death_complete, 293213, Priest_Death);
    
    eq.register_npc_event('summoners', Event.signal, 293212, Grand_Signal);
    eq.register_npc_event('summoners', Event.spawn, 293212, Grand_Spawn);
    eq.register_npc_event('summoners', Event.timer, 293212, Grand_Timer);
    eq.register_npc_event('summoners', Event.death_complete, 293212, Grand_Death);
    
    eq.register_npc_event('summoners', Event.death_complete, 293214, Provoker_Death);
    eq.register_npc_event('summoners', Event.combat, 293214, Provoker_Combat);
    eq.register_npc_event('summoners', Event.timer, 293214, Provoker_Timer);
    
    eq.register_npc_event('summoners', Event.death_complete, 293215, Lesser_Death);
    eq.register_npc_event('summoners', Event.combat, 293215, Lesser_Combat);
    eq.register_npc_event('summoners', Event.timer, 293215, Lesser_Timer);
    
    eq.register_npc_event('summoners', Event.death_complete, 293216, Greater_Death);
    eq.register_npc_event('summoners', Event.combat, 293216, Greater_Combat);
    eq.register_npc_event('summoners', Event.timer, 293216, Greater_Timer);
    
    eq.register_npc_event('summoners', Event.combat, 293217, Deranged_Combat);
    eq.register_npc_event('summoners', Event.timer, 293217, Deranged_Timer);
    
end
