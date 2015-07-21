--[[
-- Zun`Muram Mordl Delt ZMMD
-- 298020
-- http://everquest.allakhazam.com/db/quest.html?quest=4265
--
-- Zun`Muram Mordl Delt says 'Come you fools! Show me your strongest warrior and I will show you my first victim.'
--
--
-- The Encounter
--
-- Zun`Muram Mordl Delt hits for a max ~4,800 and single-target rampages.
--
-- During the encounter, he splits into multiple versions of himself (wouldn't this be convenient in everyday life).
--
-- At 90% health, the real "Zun`Muram Mordl Delt" feigns death and two clones of him spawn and attack:
--
-- Zun'Muram Mordl Delt's skin begins to bulge and split open, releasing a wave of energy. As his body falls to the floor, two smaller images of the massive creature appear before you.
--
-- The clones each hit for a max ~3,700 and should be kited until they despawn (this takes a few minutes):
--
-- Zun'Muram Mordl Delt's body begins to glow as the images before you merge back into one. The wounds upon Mordl's body quickly heal as he's infused by the energy, but new wounds appear where his other forms were injured.
--
-- At 70% health, he feigns death again and spawns three clones which, again, should be kited until they despawn.
--
-- He does this again at 50% (four clones to be kited until despawn).
--
-- At 30%, he spawns two clones (weaker in power), but this time, doesn't feign death. Here, he needs to be killed while you kite and/or offtank the two clones.
--
-- In a final act of desperation, Mordl splits two smaller forms off from himself but looks visibly drained by the effort.
--
-- NOTE: In all cases, and if your raid force can withstand it, you can kill the clones instead of kiting them.
--
--
-- Completion & Loot
--
-- Zun`Muram Mordl Delt has been slain by _____!
-- The creature's two heads face each other just before it falls to the floor, shaking the very foundation of the temple. Now there is nothing that stands between you and the being in charge of this invading army.
--
-- The chamber is filled with the sound of a grinding stone. The path leading into the final chamber has been opened and it awaits your arrival. You hear a voice that sounds oddly familiar. 'Come now, fools, enter my chamber and learn the meaning of suffering from one bred to destroy and conquer. You have beaten the best of my army, but you have yet to see true power. Step into the abyss and cower at what stares back at you.'
--
--]]
local ZMMD_Active = "SERFQMCNIDf"
local ZMMD_Inactive = "ABfHG";

-- Youtube Video indicated a ~3min kite
local kite_time = 180;

function ZMMD_Spawn(e)
  eq.set_next_hp_event(90);
end

function ZMMD_Combat(e)
  if (e.joined == true) then

    e.self:Say("Come you fools! Show me your strongest warrior and I will show you my first victim.");
  else
    eq.set_timer("wipecheck", 1 * 1000);
  end
end

function ZMMD_Activate(e)
  e.self:Emote("'s body begins to glow as the images before you merge back into one. The wounds upon Mordl's body quickly heal as he's infused by the energy, but new wounds appear where his other forms were injured. ");
  eq.modify_npc_stat("special_attacks", ZMMD_Active);
  e.self:SetAppearance(0);
  eq.stop_timer("wipecheck");
end

function ZMMD_Inactivate(e)
  eq.modify_npc_stat("special_attacks", ZMMD_Inactive);
  e.self:SetAppearance(3);
  e.self:WipeHateList();
end

function ZMMD_Timer(e)
  if (e.timer == "zmmd_kite") then
    eq.stop_timer(e.timer);
      eq.depop_all(298050);
      eq.depop_all(298051);
      eq.depop_all(298052);
    ZMMD_Activate(e);
  elseif ("wipecheck") then
    -- Check to see if there are any Clients in the room with ZMKP
    local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
    if (client:IsClient() == false) then
      -- Wipe Mechanics
      eq.get_entity_list():FindDoor(13):SetLockPick(0);
      eq.depop_all(298050);
      eq.depop_all(298051);
      eq.depop_all(298052);
      eq.depop_all(298053);
      eq.spawn2(298020, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
      eq.depop();
    end
  end
end

function ZMMD_Hp(e)
  if (e.hp_event == 90) then
    eq.get_entity_list():FindDoor(13):SetLockPick(-1);

    e.self:Emote("skin begins to bulge and split open, releasing a wave of energy. As his body falls to the floor, two smaller images of the massive creature appear before you. ");

    eq.set_next_hp_event(70);

    ZMMD_Inactivate(e);
    eq.spawn2(298050,0,0, 367, 130, -6.7, 185);
    eq.spawn2(298050,0,0, 367, 151, -6.7, 197);

    eq.set_timer("zmmd_kite", kite_time * 1000);

  elseif (e.hp_event == 70) then
    eq.set_next_hp_event(50);

    ZMMD_Inactivate(e);
    eq.spawn2(298051,0,0, 367, 130, -6.7, 185);
    eq.spawn2(298051,0,0, 367, 151, -6.7, 197);
    eq.spawn2(298051,0,0, 367, 171, -6.7, 197);
    eq.set_timer("zmmd_kite", kite_time * 1000);

  elseif (e.hp_event == 50) then
    eq.set_next_hp_event(30);

    ZMMD_Inactivate(e);
    eq.spawn2(298052,0,0, 367, 130, -6.7, 185);
    eq.spawn2(298052,0,0, 367, 151, -6.7, 197);
    eq.spawn2(298052,0,0, 367, 170, -6.7, 197);
    eq.spawn2(298052,0,0, 367, 110, -6.7, 197);
    eq.set_timer("zmmd_kite", kite_time * 1000);

  elseif (e.hp_event == 30) then
    eq.modify_npc_stat("min_hit", "1670");
    eq.modify_npc_stat("max_hit", "4900");
    eq.spawn2(298053,0,0, 367, 151, -6.7, 197);
    eq.spawn2(298053,0,0, 367, 171, -6.7, 197);

  end

end

function ZMMD_Signal(e)
  if (e.signal == 1) then
    ZMMD_Activate(e);
  end
end

function ZMMD_Death(e)
  eq.signal(298223, 298020);

  eq.get_entity_list():FindDoor(13):SetLockPick(0);
end

function ZMMD_Add_Death(e)
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID( 298050 ) == false
    and eq.get_entity_list():IsMobSpawnedByNpcTypeID( 298051 ) == false
    and eq.get_entity_list():IsMobSpawnedByNpcTypeID( 298052 ) == false) then

    -- Wake ZMMD Main Mob back up.
    eq.signal(298020,1);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('zmmd', Event.spawn,          298020, ZMMD_Spawn);
  eq.register_npc_event('zmmd', Event.combat,         298020, ZMMD_Combat);
  eq.register_npc_event('zmmd', Event.timer,          298020, ZMMD_Timer);
  eq.register_npc_event('zmmd', Event.hp,             298020, ZMMD_Hp);
  eq.register_npc_event('zmmd', Event.signal,         298020, ZMMD_Signal);
  eq.register_npc_event('zmmd', Event.death_complete, 298020, ZMMD_Death);

  eq.register_npc_event('zmmd', Event.death_complete, 298050, ZMMD_Add_Death);
  eq.register_npc_event('zmmd', Event.death_complete, 298051, ZMMD_Add_Death);
  eq.register_npc_event('zmmd', Event.death_complete, 298052, ZMMD_Add_Death);
end
