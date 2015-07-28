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
local ZMKP_Active = "SERFQMCNIDf"
local ZMKP_Inactive = "ABfHG";

local ZMKP_AC     = 1800; -- Defense
local ZMKP_MaxHit = 3900; -- Fury
local ZMKP_MinHit = 1430;
local ZMKP_AtkHit = 2000; -- Rage
local ZMKP_Haste  = -27;  -- Speed

-- Time out on Balancing seemed to be about 70 seconds
local ZMKP_Balance_Timer = 70 * 1000;

local ZMKP_Fury = 100;
local ZMKP_Rage = 100;
local ZMKP_Speed = 100;
local ZMKP_Defense = 100;

function ZMKP_Spawn(e)
  eq.spawn2(298125, 0, 0, 412.0, -714.0, -4.125, 227.0);
  eq.spawn2(298126, 0, 0, 339.0, -714.0, -4.125, 44.0);
  eq.spawn2(298127, 0, 0, 412.0, -646.0, -4.125, 159.0);
  eq.spawn2(298128, 0, 0, 339.0, -646.0, -4.125, 95.0);

  e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
  e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
  e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
  e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
  e.self:ModifyNPCStat("attack_speed",  tostring(ZMKP_Haste));
  eq.set_next_hp_event(90);
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
    local speed = math.floor(eq.get_entity_list():GetMobByNpcTypeID(298125):GetHPRatio());
    local defen = math.floor(eq.get_entity_list():GetMobByNpcTypeID(298126):GetHPRatio());
    local fury  = math.floor(eq.get_entity_list():GetMobByNpcTypeID(298127):GetHPRatio());
    local rage  = math.floor(eq.get_entity_list():GetMobByNpcTypeID(298128):GetHPRatio());
    local zmkp  = math.floor(eq.get_entity_list():GetMobByNpcTypeID(298029):GetHPRatio());

    local low = math.floor(zmkp - 3);
    local hi  = math.floor(zmkp + 3);

    if ( speed < low or speed > hi) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Speed is falling out of balance. ");
      ZMKP_Haste = ZMKP_Haste -3;
      e.self:ModifyNPCStat("attack_speed",  tostring(ZMKP_Haste));
    else
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Speed seems to be tipping in your favor. ");
    end
    if ( defen < low or defen > hi) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Defense is falling out of balance. ");
      ZMKP_AC = ZMKP_AC + 150;
      e.self:ModifyNPCStat("ac",            tostring(ZMKP_AC));
    else
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Defense seems to be tipping in your favor. ");
    end
    if ( fury  < low or fury  > hi) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Fury is falling out of balance. ");
      ZMKP_MaxHit = ZMKP_MaxHit + 585;
      ZMKP_MinHit = ZMKP_MinHit + 215;
      e.self:ModifyNPCStat("max_hit",       tostring(ZMKP_MaxHit));
      e.self:ModifyNPCStat("min_hit",       tostring(ZMKP_MinHit));
    else
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Fury seems to be tipping in your favor. ");
    end
    if ( rage  < low or rage  > hi) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Rage is falling out of balance. ");
      ZMKP_AtkHit = ZMKP_AtkHit + 300;
      e.self:ModifyNPCStat("atk",           tostring(ZMKP_AtkHit));
    else
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Balance of Rage seems to be tipping in your favor. ");
    end
--eq.zone_emote(14, 'low => ' .. low .. ' hi => ' .. hi .. ' Fury => ' .. fury .. " Rage => " .. rage .. " Speed => " .. speed .. " Defense => " .. defen );
    eq.signal(298125, 1);
    eq.signal(298126, 1);
    eq.signal(298127, 1);
    eq.signal(298128, 1);
    eq.modify_npc_stat("special_attacks", ZMKP_Active);
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

    eq.set_next_hp_event( e.hp_event -10);
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:Emote(" enters a state of battle meditation. ");
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 80) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 70) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 60) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 50) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 40) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 30) then
    eq.set_next_hp_event( e.hp_event -10);
    e.self:Emote(" enters a state of battle meditation. ");
    eq.set_timer("balance", ZMKP_Balance_Timer);
    e.self:NPCSpecialAttacks(ZMKP_Inactive, 0);
    e.self:SetOOCRegen(0);
    e.self:WipeHateList();

    eq.signal(298125, 2);
    eq.signal(298126, 2);
    eq.signal(298127, 2);
    eq.signal(298128, 2);

  elseif (e.hp_event == 20) then
    e.self:Emote("enters a state of seething rage as he accelerates his combat speed. ");
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
    eq.modify_npc_stat("special_attacks", "ABHfG");
    e.self:SetHP(e.self:GetMaxHP());
    e.self:WipeHateList();
  elseif (e.signal == 2) then
    eq.modify_npc_stat("special_attacks", "");
    e.self:SetHP(e.self:GetMaxHP());
    e.self:WipeHateList();
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
end

function event_encounter_unload(e)
end
