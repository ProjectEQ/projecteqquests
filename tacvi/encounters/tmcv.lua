--[[
-- Initial Fight
--
-- Tunat`Muram Cuu Vauax says 'You have defiled my chambers and destroyed my officers. I will crush your soul and suck the marrow from your bones.'
--
-- Tunat`Muram Cuu Vauax hits for a max ~4,400 (no rampage; no flurry; no special effects). He is permanently rooted in place and summons when damaged. He has an extra summon for players who try to get away from him:
--
-- Tunat`Muram Cuu Vauax says 'You can not evade my reach so easily, coward!'
-- Tunat`Muram Cuu Vauax begins to cast a spell. <Immobilizing Spikes>
--
-- Immobilizing Spikes: Single Target, Unresistable (0)
-- 1: Root
-- 2: Decrease Hitpoints by 200 per tick
--
-- He is surrounded by nine aneuks. Their sole purpose is to regenerate the Tunat`Muram throughout the event, prolonging his death:
--
-- Tunat`Muram Cuu Vauax pauses for a moment as a portion of his spirit is transferred into one of the phylacteries.
--
-- You can attack and kill these aneuks; however, their DPS output and health are comparable to that of the mastruq mobs encountered in the zone, and they also cast a DOT on whoever is on their hate list.
--
-- Once Tunat`Muram Cuu Vauax reaches 40%, 2x "an ukun biledrinker" become active. You can either kill them or offtank them (they will despawn when Tunat`Muram does). They can be stunned, but not mezzed.
--
-- When Tunat`Muram Cuu Vauax reaches 0%, he despawns and respawns behind the altar area (NOT auto-aggro). This version will be much meaner:
--
-- In an explosion of energy, Tunat'Muram Cuu Vauax disappears while ancient pebbles pelt against your armor.
--
-- The room is filled with an eerie laugh. 'You have done well to defeat my doppelganger and have shown great strength by making it this far, but I'm afraid I must end your struggle here. Your days have been numbered since you first set foot upon this continent and your time is up. Kneel before me and I will grant you a quick death, but resist and you will suffer in ways that will be spoken about in hushed tones for eons to come.
--
--
-- That Was Too Easy; Now the Main Event
--
-- You can take as much time to rez, med, rebuff, etc. as necessary as there is no apparent timer to engage. (This also acts as a reset point for the event. If you fail this part, you don't have to repeat the initial fight.)
--
-- When ready, engage him again. Here, he hits for a max ~4,800 and buffs himself with "Haste of the Tunat'Muram":
--
-- Haste of the Tunat'Muram: Self 0', Unresistable (0) 4740
-- 1: Increase Attack Speed by 50%
-- 2: Increase Damage Shield by 60
--
-- At 90% health and every 10% health after (down to 20%), he transforms into one of his lieutenants:
--
-- Tunat`Muram Cuu Vauax shimmers and changes before your eyes.
--
-- 90%: Pixtt Xxeric Kex (flurries; immediately spawns four ukun adds - stunnable, but not mezzable)
-- 80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns 4x "an ikaav hatchling" adds if you take too long)
-- 70%: Pixtt Riel Tavas (unstable construct adds if you take too long)
-- 60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee)
-- 50%: Zun`Muram Yihst Vor (single-target rampage; straight melee)
-- 40%: Zun`Muram Mordl Delt (single-target rampage; flurries; spawns 2x "Zun`Muram Mordl Delt" adds)
-- 30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee)
--
-- At 20%, he reforms as "Tunat`Muram Cuu Vauax" once again...
--
-- Zun`Muram Shaldn Boc shimmers and changes before your eyes.
--
-- Tunat`Muram Cuu Vuaux says 'You are stronger than I anticipated. While you have exhausted the fleeting spirit of my underlings, you have yet to face my true fury!'
--
-- For now, he hits for a max ~5,300 and remains simple enough. By 15% health, however, things start to pick up...
--
-- Below 15% health, he starts hitting for a max ~6,500 and frequently single-target rampages and flurries. He also increases his attack speed and uses an arsenal of spells that are cast with some frequency:
--
-- Haste of the Tunat'Muram: Self 0', Unresistable (0) 4740
-- 1: Increase Attack Speed by 50%
-- 2: Increase Damage Shield by 60
--
-- Bellow of Tunat'Muram: NPC Hatelist 1000', Chromatic (-200) 5555
-- 1: Silence
-- 2: Decrease Hitpoints by 800
-- 3: Increase Curse Counter by 16
-- 4: Decrease Accuracy by 20%
--
-- Discord's Rebuke: PB AE 100', Chromatic (-250) 4739
-- 1: Decrease Hitpoints by 3000
--
-- Gaze of the Tunat'Muram: Targeted AE 30', Prismatic (-300) 5546
-- 1: Decrease Spell Haste by 50%
-- 2: Decrease HP when cast by 1500
-- 3: Decrease Hitpoints by 1000 per tick
-- 4: Decrease WIS by 50
-- 5: Decrease INT by 50
-- 6: Decrease Mana by 150 per tick
-- 7: Limit: Combat Skills Not Allowed
--
-- Ikaav's Venom: PB AE 300', Magic (-300) 751
-- 1: Decrease Attack Speed by 50%
-- 2: Decrease HP when cast by 4050
-- 3: Increase Poison Counter by 36
--
-- Spirit Cleaver: Single Target, Prismatic (-350) 4729
-- 1: Decrease ATK by 500
-- 2: Decrease Hitpoints by 1225 per tick
-- 3: Decrease Mana by 400 per tick
-- 4: Decrease Endurance by 400 per tick
-- 5: Decrease Stats by 350
-- 6: Increase Poison Counter by 99
-- 7: Increase Poison Counter by 99
-- 8: Increase Poison Counter by 99
--
-- Touch of the Tunat'Muram: Targeted AE 30', Prismatic (-300) 5545
-- 1: Decrease HP when cast by 2000
-- 2: Decrease Hitpoints by 1500 per tick
-- 3: Decrease Mana by 100 per tick
-- 4: Decrease Endurance by 100 per tick
-- 5: Decrease STR by 50
-- 6: Decrease ATK by 300
--
-- Wave of Rage: PB AE 100', Prismatic (-350) 4728
-- 1: Decrease Spell Mana Cost by 0%
-- 2: Decrease HP when cast by 4050
-- 3: Decrease Hitpoints by 500 per tick
-- 4: Decrease INT by 400
-- 5: Decrease WIS by 400
-- 6: Increase Poison Counter by 99
-- 7: Increase Poison Counter by 99
-- 8: Increase Poison Counter by 99
-- 9: Increase Poison Counter by 99
-- 10: Limit: Combat Skills Not Allowed
--
-- Kill him to complete the event.
--
--
-- Event Completion & Loot
--
-- Tunat`Muram Cuu Vuaux has been slain by _____!
--
-- Tunat`Muram Cuu Vuaux's corpse says 'Impossible! You have not been tested in the fires of discord, yet you have devastated the best the legion could muster. How can a world untouched by the crucible of chaos breed warriors of such strength? Mata Muram must be warned! He must prepare for your coming!'
--
-- Loot from this event includes 2 "Cracked Shard of Power" (Breakdown in Communication item) + 1 "Tongue of the Tunat'muram" + 2 augmentations (first list) + 2 other items (second list):
--
-- Mobs Used:
--  298014 Tunat (1st)
--  298055 Tunat (2nd)
--  298209 an ukun biledrinker (spawns at 40% of Tunat (1st)'s health)
--  298113 Living Phylactery (Tunat 1st) Guards
--  298044 An ukun juxta pincer: 60k hp, doubles,flurries, 635-2820 min/max
--  298042 an ukun manasipper:double, 600-2120min/max, 116k hp
--  298043 an ukun lifebleeder: doubles, flurries, 80k hp, 600-2120min/max
--  298041 an ukun ragehound: double, flurries, 114k hp, 650-2990
--  298048 an_ikaav_hatchling
--  298045 an_unstable_construct
--  298050 Zun`Muram_Mordl_Delt
--
--]]
local Ukun_Inactive = "19,1^20,1^21,1^24,1^25,1"; 
local Ukun_Active = "7,1^13,1^14,1^15,1^17,1^21,1";

local lp_mob = nil;
local tunat_id = nil;
local tunat_heal = nil;
local tunat_hp = nil;
local lp_list = {};

function Tunat_Second_Spawn()
  eq.set_next_hp_event(90);
end

function Tunat_Second_Death(e)
  eq.signal(298223, 298055); -- NPC: zone_status
end

function Tunat_Second_HP(e)
  if (e.hp_event == 90) then
    -- 90%: Pixtt Xxeric Kex (flurries; immediately spawns four ukun adds - stunnable, but not mezzable)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
    eq.modify_npc_stat("min_hit", "1270");
    eq.modify_npc_stat("max_hit", "4500");

    e.self:SendIllusionPacket({race=393,gender=2,texture=11});
    e.self:TempName("Pixtt Xxeric Kex");

    -- Spawn Adds
    eq.spawn2(298044, 0, 0, 334, -117, 21, 280); -- NPC: an_ukun_juxtapincer
    eq.spawn2(298043, 0, 0, 356, -154, 21, 356); -- NPC: an_ukun_lifebleeder
    eq.spawn2(298042, 0, 0, 353, -201, 21, 434); -- NPC: an_ukun_manasipper
    eq.spawn2(298041, 0, 0, 322, -215, 21, 496); -- NPC: an_ukun_ragehound

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram

    eq.set_next_hp_event(80);

  elseif (e.hp_event == 80) then
    -- 80%: Pixtt Kretv Krakxt (mitigated AE rampage; spawns 4x "an ikaav hatchling" adds if you take too long)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    eq.modify_npc_stat("min_hit", "1272");
    eq.modify_npc_stat("max_hit", "4432");

    e.self:SendIllusionPacket({race=394,gender=2,texture=11});
    e.self:TempName("Pixtt Kretv Kakxt");

    eq.set_timer("pkk_adds", 30 * 1000);

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_next_hp_event(70);

  elseif (e.hp_event == 70) then
    -- 70%: Pixtt Riel Tavas (unstable construct adds if you take too long)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
    eq.modify_npc_stat("min_hit", "1560");
    eq.modify_npc_stat("max_hit", "4600");

    e.self:SendIllusionPacket({race=394,gender=2,texture=11});
    e.self:TempName("Pixtt Riel Tavas");

    eq.stop_timer("pkk_adds");
    eq.set_timer("prt_adds", 30 * 1000);

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_next_hp_event(60);

  elseif (e.hp_event == 60) then
    -- 60%: Zun`Muram Kvxe Pirik (single-target rampage; straight melee)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SendIllusionPacket({race=400,gender=2,texture=11});
    e.self:TempName("Zun`Muram Kvxe Pirik");
    eq.modify_npc_stat("min_hit", "1430");
    eq.modify_npc_stat("max_hit", "3900");

    eq.stop_timer("prt_adds");

    eq.set_next_hp_event(50);

  elseif (e.hp_event == 50) then
    -- 50%: Zun`Muram Yihst Vor (single-target rampage; straight melee)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
    eq.modify_npc_stat("min_hit", "1650");
    eq.modify_npc_stat("max_hit", "4500");

    e.self:SendIllusionPacket({race=400,gender=2,texture=11});
    e.self:TempName("Zun`Muram Yihst Vor");

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_next_hp_event(40);

  elseif (e.hp_event == 40) then
    -- 40%: Zun`Muram Mordl Delt (single-target rampage; flurries; spawns 2x "Zun`Muram Mordl Delt" adds)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.area_rampage, 0);
    e.self:SetSpecialAbility(SpecialAbility.rampage, 1);
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
    eq.modify_npc_stat("min_hit", "1350");
    eq.modify_npc_stat("max_hit", "4200");

    e.self:SendIllusionPacket({race=400,gender=2,texture=11});
    e.self:TempName("Zun`Muram Mordl Delt");

    eq.spawn2(298050, 0, 0, 334, -117, 21, 280); -- NPC: Zun`Muram_Mordl_Delt
    eq.spawn2(298050, 0, 0, 356, -154, 21, 356); -- NPC: Zun`Muram_Mordl_Delt
    
    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_next_hp_event(30);

  elseif (e.hp_event == 30) then
    -- 30%: Zun`Muram Shaldn Boc (single-target rampage; straight melee)
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
    eq.modify_npc_stat("min_hit", "1470");
    eq.modify_npc_stat("max_hit", "4700");

    e.self:SendIllusionPacket({race=400,gender=2,texture=11});
    e.self:TempName("Zun`Muram Shaldn Boc");

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_next_hp_event(20);

  elseif (e.hp_event == 20) then
    -- 20%: he reforms as Tunat`Muram Cuu Vauax once again...
    e.self:Emote("shimmers and changes before your eyes.");
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
    eq.modify_npc_stat("min_hit", "1450");
    eq.modify_npc_stat("max_hit", "4300");

    e.self:SendIllusionPacket({race=399,gender=2,texture=11});
    e.self:TempName("Tunat`Muram Cuu Vauax");

    -- Rehaste 4740
    e.self:CastSpell(4740, e.self:GetID()); -- Spell: Haste of the Tunat`Muram
    
    eq.set_timer("ae_timer", 3 * 1000);

  end
end

function Tunat_First_Death(e)
	eq.spawn2(298055,0,0, 309, -170.8, 21.3, 118.8); -- NPC: #Tunat`Muram_Cuu_Vauax

  eq.depop_all(298113);
  eq.depop_all(298209);
end

function Tunat_First_Spawn(e)
  eq.set_next_hp_event(40);

  -- Spawn the Dogs
  eq.spawn2(298209, 0, 0, 445, -203, 25, 34); -- NPC: an_ukun_biledrinker
  eq.spawn2(298209, 0, 0, 447, -139, 25, 198); -- NPC: an_ukun_biledrinker

  -- Spawn the Living
  lp_list[1] = eq.spawn2(298113, 0, 0,500.00, -152.00, 23.75, 112); -- NPC: Living_Phylactery
  lp_list[2] = eq.spawn2(298113, 0, 0,507.00, -172.00, 23.75, 112); -- NPC: Living_Phylactery
  lp_list[3] = eq.spawn2(298113, 0, 0,498.00, -193.00, 23.75, 112); -- NPC: Living_Phylactery
  lp_list[4] = eq.spawn2(298113, 0, 0,476.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
  lp_list[5] = eq.spawn2(298113, 0, 0,428.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
  lp_list[6] = eq.spawn2(298113, 0, 0,454.00, -242.00, 23.75, 246); -- NPC: Living_Phylactery
  lp_list[7] = eq.spawn2(298113, 0, 0,478.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery
  lp_list[8] = eq.spawn2(298113, 0, 0,454.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery
  lp_list[9] = eq.spawn2(298113, 0, 0,431.00, -100.00, 23.75, 28); -- NPC: Living_Phylactery

end

function Tunat_First_HP(e)
  if (e.hp_event == 40) then
    -- Wake up the dogs.
    eq.signal(298209, 1); -- NPC: an_ukun_biledrinker
  end
end

function Tunat_Second_Timer(e)

  if (e.timer == "pkk_adds") then
    eq.spawn2(298013, 0, 0, 334, -117, 21, 280); -- NPC: an_ikaav_hatchling --change these so they dont trigger PKK Script.
    eq.spawn2(298013, 0, 0, 356, -154, 21, 356); -- NPC: an_ikaav_hatchling
    eq.spawn2(298013, 0, 0, 353, -201, 21, 434); -- NPC: an_ikaav_hatchling
    eq.spawn2(298013, 0, 0, 322, -215, 21, 496); -- NPC: an_ikaav_hatchling

  elseif (e.timer == "prt_adds") then
    eq.spawn2(298045, 0, 0, 334, -117, 21, 280); -- NPC: an_unstable_construct
    eq.spawn2(298045, 0, 0, 356, -154, 21, 356); -- NPC: an_unstable_construct
    eq.spawn2(298045, 0, 0, 353, -201, 21, 434); -- NPC: an_unstable_construct
    eq.spawn2(298045, 0, 0, 322, -215, 21, 496); -- NPC: an_unstable_construct
    eq.spawn2(298045, 0, 0, 322, -225, 21, 496); -- NPC: an_unstable_construct

  elseif (e.timer == "ae_timer") then
    local cast_ae = eq.ChooseRandom(1,2,3);

    if (cast_ae == 1) then
      -- 5546 -- Gaze of the Tunat'Muram
      -- 4729 -- Spirit Cleaver
      -- 4728 -- Wave of Rage
      -- 4727 -- Spear of Discord
      -- 751  -- Ikaav's Venom
      ae_spell = eq.ChooseRandom(5546, 4729, 4728, 4727, 751);
      e.self:CastSpell(ae_spell, e.self:GetTarget():GetID(), 1, 1);
    end
    
  elseif (e.timer == "wipe_check2") then
    eq.stop_all_timers();

    eq.depop_all(298044);
    eq.depop_all(298043);
    eq.depop_all(298042);
    eq.depop_all(298041);

    eq.depop_all(298048);
    eq.depop_all(298045);

    eq.depop_all(298209);

    eq.depop_all(298050);

    eq.spawn2(298055,0,0, 309, -170.8, 21.3, 118.8); -- NPC: #Tunat`Muram_Cuu_Vauax
    eq.depop();

  end
end

function Tunat_Second_Combat(e)
  if (e.joined == true) then
    eq.stop_timer('wipe_check2');
  else
    eq.set_timer('wipe_check2', 300 * 1000);
  end

end

function Tunat_First_Combat(e)
  if (e.joined == true) then
    e.self:Say("You have defiled my chambers and destroyed my officers. I will crush your soul and suck the marrow from your bones.");
    eq.set_timer('lp_store', eq.ChooseRandom(40, 49, 50, 65, 111) * 1000);
    eq.stop_timer('wipe_check1');
  else
    eq.set_timer('wipe_check1', 300 * 1000);
  end
end

function Tunat_First_Timer(e)
  if (e.timer == 'lp_store') then
    eq.stop_timer(e.timer);
    e.self:Emote("pauses for a moment as a portion of his spirit is transferred into one of the phylacteries. ");

    lp_mob = lp_list[ eq.ChooseRandom(1,2,3,4,5,6,7,8,9)]; 
    tunat_heal = e.self:GetMaxHP() * 0.10;

    e.self:FaceTarget(lp_mob);
    e.self:CastSpell(4448, lp_mob:GetID(), 1, 2); -- Spell: ShieldSP

    eq.set_timer('lp_heal', 30 * 1000 );
  elseif (e.timer == 'lp_heal') then
    eq.stop_timer(e.timer);
    eq.set_timer('lp_store', eq.ChooseRandom(40, 49, 50, 65, 111) * 1000);
    
    tunat_id = e.self:GetID();
    tunat_hp = e.self:GetHP();

    lp_mob:FaceTarget(e.self);
    lp_mob:CastSpell(4448, e.self:GetID(), 1, 3 ); -- Spell: ShieldSP
    e.self:SetHP( tunat_hp + tunat_heal );
    e.self:Emote("staggers as the portion of his spirit that was stored in the phylactery flows back into him.");

  elseif (e.timer == "wipe_check1") then
    -- Reset to the 1st Tunat 
    eq.depop();
    eq.depop_all(298113);
    eq.depop_all(298209);
    eq.spawn2(298014, 0, 0, 462, -171, 32, 16); -- NPC: #Tunat`Muram_Cuu_Vauax

  end
end

function LP_Combat(e)
  if (e.joined == true) then
    eq.set_timer('lp_ae', 30 * 1000);
  end
end

function LP_Death(e)
  e.self:CastSpell(6495, e.self:GetID()); -- Spell: Spiritual Wake
end

function LP_Timer(e)
  if (e.timer == 'lp_ae') then
    e.self:CastSpell(5546, e.self:GetTarget():GetID()); -- Spell: Gaze of the Tunat`Muram
  end
end

function Ukun_Spawn(e)
  -- When the Dogs spawn set the inactive
  e.self:ProcessSpecialAbilities(Ukun_Inactive);
end

function Ukun_Signal(e)
  -- When we get a signal fromt he controller wake the dogs up.
  e.self:ProcessSpecialAbilities(Ukun_Active);
end

function event_encounter_load(e)
  eq.register_npc_event('tmcv', Event.spawn,          298014, Tunat_First_Spawn);
  eq.register_npc_event('tmcv', Event.death_complete, 298014, Tunat_First_Death);
  eq.register_npc_event('tmcv', Event.hp,             298014, Tunat_First_HP);
  eq.register_npc_event('tmcv', Event.timer,          298014, Tunat_First_Timer);
  eq.register_npc_event('tmcv', Event.combat,         298014, Tunat_First_Combat);

  eq.register_npc_event('tmcv', Event.spawn,          298055, Tunat_Second_Spawn);
  eq.register_npc_event('tmcv', Event.combat,         298055, Tunat_Second_Combat);
  eq.register_npc_event('tmcv', Event.death_complete, 298055, Tunat_Second_Death);
  eq.register_npc_event('tmcv', Event.hp,             298055, Tunat_Second_HP);
  eq.register_npc_event('tmcv', Event.timer,          298055, Tunat_Second_Timer);

  eq.register_npc_event('tmcv', Event.combat,         298113, LP_Combat);
  eq.register_npc_event('tmcv', Event.death,          298113, LP_Death);
  eq.register_npc_event('tmcv', Event.timer,          298113, LP_Timer);

  eq.register_npc_event('tmcv', Event.spawn,          298209, Ukun_Spawn);
  eq.register_npc_event('tmcv', Event.signal,         298209, Ukun_Signal);
end
