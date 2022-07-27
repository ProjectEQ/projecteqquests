--Emoush_the_Destroyer (342052)
--#Mystic_Braggle (342053)
--#Mystic_Griknok (342055)
--#Mystic_Shiflor (342054)
--unconscious_mystic (342060)
--MinDmg: 339	MaxDmg: 1061
local addtimer = 0;

local combat_min_hit = 339;
local combat_max_hit = 1061;

--Emoush_the_Destroyer (342052)
function Emoush_spawn(e)
    eq.set_timer("spawn", 1 * 1000);
    eq.set_timer("aoe", 60 * 1000);
    eq.set_timer("powerup", 180 * 1000);
end


function Emoush_signal(e)
  if(e.signal == 1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
    e.self:ModifyNPCStat("hp_regen", "220");
    eq.stop_timer("powerup");
  elseif(e.signal == 2) then
    e.self:SetSpecialAbility(24, 1);
    e.self:SetSpecialAbility(35, 1);
    e.self:WipeHateList();
    e.self:ModifyNPCStat("hp_regen", "3200");
    eq.set_timer("powerup", 120 * 1000);
    eq.zone_emote(15, "The fallen mystics awaken.");
    addtimer = 0;
  end
end

function Emoush_timer(e)
    if (e.timer == "spawn") then
           eq.unique_spawn(342054,0,0,-165,1946,-3,45); -- NPC: #Mystic_Shiflor
           eq.unique_spawn(342053,0,0,-68,1965,0,427); -- NPC: #Mystic_Braggle
           eq.unique_spawn(342055,0,0,-141,2040,-8.15,244); -- NPC: #Mystic_Griknok
           eq.stop_timer("spawn");
    elseif (e.timer == "aoe") then
           e.self:CastSpell(5715,e.self:GetID()); -- Spell: Rumbling Stone
    elseif (e.timer == "powerup") then
            --gains 14 min dmg  283 max dmg per power up and hp(?)
            eq.stop_timer("powerup");
		    combat_min_hit=math.ceil(combat_min_hit+14);
		    combat_max_hit=math.ceil(combat_max_hit+283); 
		    e.self:ModifyNPCStat("min_hit", tostring(combat_min_hit));
		    e.self:ModifyNPCStat("max_hit", tostring(combat_max_hit));
		    eq.debug("My new min hit is: " .. combat_min_hit);
		    eq.debug("My new max hit is : " .. combat_max_hit);
            eq.set_timer("powerup", 120 * 1000);
            eq.zone_emote(15, "Emoush trembles as his power increases.");
    end
end

function Emoush_death(e)
 eq.depop_all(342060);
end

--#Mystic_Braggle Mystic_Griknok Mystic_Shiflor
function Braggle_death(e)
addtimer = addtimer + 1;
eq.spawn2(342060,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: unconscious_mystic
eq.zone_emote(15, "The goblin mystic falls to the ground unconscious.");
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(342053) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(342054) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(342055) == false) then
    eq.signal(342052,1); --signal emoush to wake up
  end
end

--unconscious_mystic (342060)

function Unconscious_spawn(e)
    eq.set_timer("liedown", 1 * 1000);
        if ( addtimer == 1 ) then
            eq.set_timer("reset", 120 * 1000);
        end
end

function Unconscious_timer(e)
    if (e.timer == "reset") then

        if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(342054) == false) then
           eq.unique_spawn(342054,0,0,-165,1946,-3,45); -- NPC: #Mystic_Shiflor
        end
        if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(342053) == false) then
            eq.unique_spawn(342053,0,0,-68,1965,0,427); -- NPC: #Mystic_Braggle
        end
        if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(342055) == false) then
            eq.unique_spawn(342055,0,0,-141,2040,-8.15,244); -- NPC: #Mystic_Griknok
        end
    
    eq.stop_timer("reset");
    
    eq.depop_all(342060); --depop unconscious mystics
    
    eq.signal(342052,2); --emoush goes back to sleep
    elseif (e.timer == "liedown") then
        e.self:SetAppearance(3);
        eq.stop_timer("liedown");
    end
end


function event_encounter_load(e)
  eq.register_npc_event('emoush', Event.timer,         342052, Emoush_timer);
  eq.register_npc_event('emoush', Event.spawn,         342052, Emoush_spawn);
  eq.register_npc_event('emoush', Event.signal,         342052, Emoush_signal);
  eq.register_npc_event('emoush', Event.death_complete,         342052, Emoush_death);
  eq.register_npc_event('emoush', Event.death_complete,         342053, Braggle_death);
  eq.register_npc_event('emoush', Event.death_complete,         342054, Braggle_death);
  eq.register_npc_event('emoush', Event.death_complete,         342055, Braggle_death);
  
  eq.register_npc_event('emoush', Event.spawn,         342060, Unconscious_spawn);
  eq.register_npc_event('emoush', Event.timer,         342060, Unconscious_timer);
 
end
