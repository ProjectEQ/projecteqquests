--[[
--
--  Tacvi Zun`Muram Kvxe Pirik Encounter
--  298029
--  http://everquest.allakhazam.com/db/quest.html?quest=4263
--
-- Zun`Muram Kvxe Pirik says 'Come you fools! Show me your strongest warrior and I will show you my first victim.'
--
--
-- Room Setup & Fight Details
--
-- In the room, you'll see Zun`Muram Kvxe Pirik surrounded by four aneuks:
--
-- - Balance of Defense
-- - Balance of Fury
-- - Balance of Rage
-- - Balance of Speed
--
-- Zun`Muram Kvxe Pirik hits for a max ~4,800 (can increase if you mess up the aneuks - more on this in a moment); single-target rampages; flurries; sees invisibility; does not see Shroud of Stealth. Upon engaging the encounter, the doors to the chamber seal shut.
--
--
-- Meditative States
--
-- At 90% (and again at 80%, 70%, 60%, 50%, 40% and 30%), Zun`Muram Kvxe Pirik goes non-aggro and enters a meditative state:
--
-- Kvxe enters a state of battle meditation.
--
-- At this point, you must DPS each Balance down so that their health matches Kvxe Pirik's health. If you succeed, the aneuk balances will 'tip in your favor':
--
-- Balance of _____ seems to be tipping in your favor.
--
-- Kvxe's body trembles as he fails to gather power from the balanced scales.
--
-- If you fail on one more balances, you will see:
--
-- Balance of _____ is falling out of balance.
--
-- Your failure to balance the scales has added to Kvxe's already impressive skills.
--
-- ...And Kvxe's skills will increase depending on which aneuk was out of balance. Don't fail too many times, otherwise the encounter becomes quite rough.
--
-- Balance of Speed - influences attack speed
-- Balance of Defense - influences mitigation and avoidance
-- Balance of Fury - influences chance to flurry
-- Balance of Rage - influences chance to rampage and its cooldown time
--
--
-- Zun`Muram Kvxe Pirik at 20%
--
-- At about 20% health, he increases his attack speed somewhat:
--
-- Kvxe enters a state of seething rage as he accelerates his combat speed.
--
--
-- Completion & Loot
--
-- Zun`Muram Kvxe Pirik has been slain by _____!
--
-- The creature's two heads face each other just before it falls to the floor, shaking the very foundation of the temple. Now there is nothing that stands between you and the being in charge of this invading army.
--]]
local ZMKP_Active = "1,1^2,1^3,1^5,1^7,1^13,1^14,1^15,1^16,1^17,1^21,1^42,1";
local ZMKP_Inactive = "19,1^20,1^21,1^24,1^25,1";

local ZMKP_AC     = 568; -- Defense
local ZMKP_MaxHit = 3900; -- Fury
local ZMKP_MinHit = 1430;
local ZMKP_AtkHit = 400; -- Rage
local ZMKP_Delay  = 20;

-- Time out on Balancing seemed to be about 70 seconds
local ZMKP_Balance_Timer = 70 * 1000;

local ZMKP_Fury = 100;
local ZMKP_Rage = 100;
local ZMKP_Speed = 100;
local ZMKP_Defense = 100;

local target_hp = 90;

local defense_balanced = false;
local fury_balanced = false;
local rage_balanced = false;
local speed_balanced = false;

function ZMKP_Spawn(e)
  eq.spawn2(298125, 0, 0, 412.0, -714.0, -4.125, 227.0);
  eq.spawn2(298126, 0, 0, 339.0, -714.0, -4.125, 44.0);
  eq.spawn2(298127, 0, 0, 412.0, -646.0, -4.125, 159.0);
  eq.spawn2(298128, 0, 0, 339.0, -646.0, -4.125, 95.0);

  ZMKP_AC     = 568; -- Defense
  ZMKP_MaxHit = 3900; -- Fury
  ZMKP_MinHit = 1430;
  ZMKP_AtkHit = 400; -- Rage
  ZMKP_Delay  = 20;

  e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
  e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
  e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
  e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
  e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
  eq.set_next_hp_event(90);
  target_hp = 90;
end

function ZMKP_Combat(e)
  if (e.joined == true) then

    e.self:Emote("Come you fools! Show me your strongest warrior and I will show you my first victim.");
  else
    eq.set_timer("wipecheck", 1 * 1000);
  end
end

function ZMKP_Timer(e)
  if (e.timer == 'balance') then
    eq.stop_timer(e.timer);
    eq.stop_timer("wipecheck");
    eq.signal(298125, 1);
    eq.signal(298126, 1);
    eq.signal(298127, 1);
    eq.signal(298128, 1);

    local failed = false;

    if (not speed_balanced) then
      -- Reduce ZMKP's Attack Delay by 10% each time the Speed mob is out of Balance.
      ZMKP_Delay = ZMKP_Delay * 0.90;
      e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
      failed = true;
    end
    if (not defense_balanced) then
      ZMKP_AC = ZMKP_AC + 100;
      e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
      failed = true;
    end
    if (not fury_balanced) then
      ZMKP_MaxHit = ZMKP_MaxHit + 585;
      ZMKP_MinHit = ZMKP_MinHit + 215;
      e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
      e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
      failed = true;
    end
    if (not rage_balanced) then
      ZMKP_AtkHit = ZMKP_AtkHit + 200;
      e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
      failed = true;
    end

    if (failed) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Your failure to balance the scales has added to Kvxe's already impressive skills.");
    else
      eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe's body trembles as he fails to gather power from the balanced scales.");
    end

    -- so dots will oddly still hurt him, with enough necros it is possible to skip an event if we just used HP events (live doesn't skip, probably does if you manage to kill him though)
    -- So instead of just using straight HP events, we gotta do some checking here!
    if (math.floor(e.self:GetHPRatio()) <= (target_hp - 10)) then
        -- we'll we gotta skip an active phase basically, to next balance!
        eq.set_timer("balance", ZMKP_Balance_Timer);
        eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
        e.self:SetOOCRegen(0);
        target_hp = target_hp - 10;

        eq.signal(298125, 2);
        eq.signal(298126, 2);
        eq.signal(298127, 2);
        eq.signal(298128, 2);
    else
        e.self:ProcessSpecialAbilities(ZMKP_Active);
        target_hp = target_hp - 10;
        eq.set_next_hp_event(target_hp);
    end
  elseif (e.timer == "wipecheck") then
    -- Check to see if there are any Clients in the room with ZMKP
    local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 9000);
    if (client:IsClient() == false) then
      -- Clean up after a wipe
      eq.depop_all(298125);
      eq.depop_all(298126);
      eq.depop_all(298127);
      eq.depop_all(298128);

      eq.spawn2(298029, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
      eq.depop();

      eq.get_entity_list():FindDoor(16):SetLockPick(0);
    end
  end
end

function ZMKP_Hp(e)
  if (e.hp_event == 90) then
    eq.get_entity_list():FindDoor(16):SetLockPick(-1);

    eq.set_timer("balance", ZMKP_Balance_Timer);
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 80) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 70) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 60) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 50) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 40) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 30) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of battle meditation.");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 20) then
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, "Kvxe enters a state of seething rage as he accelerates his combat speed.");
    ZMKP_Delay = ZMKP_Delay * 0.90;
    e.self:ModifyNPCStat("attack_delay",  tostring(ZMKP_Delay));
  end
end

function ZMKP_Signal(e)
end

function ZMKP_Death(e)
  eq.signal(298223, 298029);

  eq.depop_all(298125);
  eq.depop_all(298126);
  eq.depop_all(298127);
  eq.depop_all(298128);
  eq.get_entity_list():FindDoor(16):SetLockPick(0);
end

function ZMKP_Spawn_Speed(e)
  e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Defense(e)
  e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Fury(e)
  e.self:SetOOCRegen(0);
end

function ZMKP_Spawn_Rage(e)
  e.self:SetOOCRegen(0);
end

function ZMKP_Signal_Balance(e)
  if (e.signal == 1) then
    e.self:ProcessSpecialAbilities(ZMKP_Inactive);
    e.self:SetHP(e.self:GetMaxHP());
    e.self:WipeHateList();

    -- lets double check
    if (e.self:GetHPRatio() <= (target_hp - 3)) then
      local id = e.self:GetNPCTypeID();
      if (id == 298125) then
        speed_balanced = false;
      elseif (id == 298126) then
        defense_balanced = false;
      elseif (id == 298127) then
        fury_balanced = false;
      elseif (id == 298128) then
        rage_balanced = false;
      end
      eq.get_entity_list():MessageClose(e.self, false, 120, 15, e.self:GetCleanName() .. " is falling out of balance.");
    end
  elseif (e.signal == 2) then
    defense_balanced = false;
    fury_balanced = false;
    rage_balanced = false;
    speed_balanced = false;

    eq.set_next_hp_event(target_hp + 3);
    e.self:ProcessSpecialAbilities("42,1")
    e.self:SetHP(e.self:GetMaxHP());
    e.self:WipeHateList();
  end
end

function ZMKP_Hp_Balance(e)
  if (e.hp_event == (target_hp + 3)) then
    local id = e.self:GetNPCTypeID();
    if (id == 298125) then
      speed_balanced = true;
    elseif (id == 298126) then
      defense_balanced = true;
    elseif (id == 298127) then
      fury_balanced = true;
    elseif (id == 298128) then
      rage_balanced = true;
    end
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, e.self:GetCleanName() .. " seems to be tipping in your favor.");
    eq.set_next_hp_event(target_hp - 3)
  elseif (e.hp_event == (target_hp - 3)) then
    local id = e.self:GetNPCTypeID();
    if (id == 298125) then
      speed_balanced = false;
    elseif (id == 298126) then
      defense_balanced = false;
    elseif (id == 298127) then
      fury_balanced = false;
    elseif (id == 298128) then
      rage_balanced = false;
    end
    eq.get_entity_list():MessageClose(e.self, false, 120, 15, e.self:GetCleanName() .. " is falling out of balance.");
  end
end

function event_encounter_load(e)
  eq.register_npc_event('zmkp', Event.spawn,          298029, ZMKP_Spawn);
  eq.register_npc_event('zmkp', Event.combat,         298029, ZMKP_Combat);
  eq.register_npc_event('zmkp', Event.timer,          298029, ZMKP_Timer);
  eq.register_npc_event('zmkp', Event.hp,             298029, ZMKP_Hp);
  eq.register_npc_event('zmkp', Event.signal,         298029, ZMKP_Signal);
  eq.register_npc_event('zmkp', Event.say,            298029, ZMKP_Say);
  eq.register_npc_event('zmkp', Event.death_complete, 298029, ZMKP_Death);

  eq.register_npc_event('zmkp', Event.spawn,          298125, ZMKP_Spawn_Speed);
  eq.register_npc_event('zmkp', Event.spawn,          298126, ZMKP_Spawn_Defense);
  eq.register_npc_event('zmkp', Event.spawn,          298127, ZMKP_Spawn_Fury);
  eq.register_npc_event('zmkp', Event.spawn,          298128, ZMKP_Spawn_Rage);

  eq.register_npc_event('zmkp', Event.signal,         298125, ZMKP_Signal_Balance);
  eq.register_npc_event('zmkp', Event.signal,         298126, ZMKP_Signal_Balance);
  eq.register_npc_event('zmkp', Event.signal,         298127, ZMKP_Signal_Balance);
  eq.register_npc_event('zmkp', Event.signal,         298128, ZMKP_Signal_Balance);

  eq.register_npc_event('zmkp', Event.hp,             298125, ZMKP_Hp_Balance);
  eq.register_npc_event('zmkp', Event.hp,             298126, ZMKP_Hp_Balance);
  eq.register_npc_event('zmkp', Event.hp,             298127, ZMKP_Hp_Balance);
  eq.register_npc_event('zmkp', Event.hp,             298128, ZMKP_Hp_Balance);
end

function event_encounter_unload(e)
end
