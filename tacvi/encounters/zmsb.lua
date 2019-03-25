--[[
-- Tacvi: ZMSB
-- 298018
--  http://everquest.allakhazam.com/db/quest.html?quest=4264
--
-- The Encounter 
--
-- Zun`Muram Shaldn Boc is a fairly straightforward fight. No adds or special AEs here. 
--
-- He hits for a max ~4,800 (standard melee) and single-target rampages. 
--
-- Throughout the fight, he'll enter a "blind rage" (emote warned) and increase his max hit to ~5,400: 
--
-- Zun'Muram Shaldn Boc starts to foam at the mouth as he enters a blind rage. 
--
-- This lasts 20 seconds before you see this: 
--
-- Zun'Muram Shaldn Boc looks weakened as the rage ends. 
--
-- Later into the fight, he may enter his blind rage and not leave it. 
--
-- Zun'Muram Shaldn Boc has been slain by _____! 
--
-- The creature's two heads face each other just before it falls to the floor, shaking the very foundation of the temple. Now there is nothing that stands between you and the being in charge of this invading army. 
--]]
function ZMSB_Spawn(e)
  eq.set_next_hp_event(90);
end

function ZMSB_Combat(e)
  if (e.joined == true) then
    e.self:Say("Come you fools! Show me your strongest warrior and I will show you my first victim.");
    
  else
    -- Wipe Mechanics
    eq.get_entity_list():FindDoor(8):SetLockPick(0);
    eq.spawn2(298018, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
    eq.depop();
  end
end

function ZMSB_Timer(e)
  eq.stop_timer(e.timer);
  if (e.timer == "rage_stop") then
    e.self:ModifyNPCStat("min_hit", "1470");
    e.self:ModifyNPCStat("max_hit", "4700");

    e.self:Emote(" looks weakened as the rage ends. ");
  end
end

function ZMSB_Hp(e)

  if (e.hp_event == 90) then
    eq.get_entity_list():FindDoor(8):SetLockPick(-1);
    eq.set_next_hp_event(75);
    
  elseif (e.hp_event == 75) then
    eq.set_next_hp_event(50);

    e.self:Emote("starts to foam at the mouth as he enters a blind rage. ");
    e.self:ModifyNPCStat("min_hit", "1525");
    e.self:ModifyNPCStat("max_hit", "4850");

    eq.stop_timer('rage_stop');
    eq.set_timer('rage_stop', 20 * 1000);

  elseif (e.hp_event == 50) then
    eq.set_next_hp_event(35);

    e.self:Emote("starts to foam at the mouth as he enters a blind rage. ");
    e.self:ModifyNPCStat("min_hit", "1635");
    e.self:ModifyNPCStat("max_hit", "5150");

    eq.stop_timer('rage_stop');
    eq.set_timer('rage_stop', 20 * 1000);

  elseif (e.hp_event == 35) then
    eq.set_next_hp_event(15);

    e.self:Emote("starts to foam at the mouth as he enters a blind rage. ");
    e.self:ModifyNPCStat("min_hit", "1800");
    e.self:ModifyNPCStat("max_hit", "6500");

    eq.stop_timer('rage_stop');
    eq.set_timer('rage_stop', 20 * 1000);

  elseif (e.hp_event == 15) then
    -- Later into the fight, he may enter his blind rage and not leave it. 
    eq.stop_all_timers();
    e.self:Emote("starts to foam at the mouth as he enters a blind rage. ");
    e.self:ModifyNPCStat("min_hit", "1965");
    e.self:ModifyNPCStat("max_hit", "6050");

  end
end

function ZMSB_Death(e)
  eq.signal(298223, 298018); -- NPC: zone_status
  eq.get_entity_list():FindDoor(8):SetLockPick(0);

  e.other:Message(12,"The creature's two heads face each other just before it falls to the floor, shaking the very foundation of the temple. Now there is nothing that stands between you and the being in charge of this invading army. ");
end

function event_encounter_load(e)
  eq.register_npc_event('zmsb', Event.spawn,          298018, ZMSB_Spawn);
  eq.register_npc_event('zmsb', Event.combat,         298018, ZMSB_Combat);
  eq.register_npc_event('zmsb', Event.timer,          298018, ZMSB_Timer);
  eq.register_npc_event('zmsb', Event.hp,             298018, ZMSB_Hp);
  eq.register_npc_event('zmsb', Event.death_complete, 298018, ZMSB_Death);
end
