--[[
-- PXK Event
-- Pixtt Xxeric Kex
-- First event in Tacvi
-- http://everquest.allakhazam.com/db/quest.html?quest=4260
--
-- Pixtt Xxeric Kex: 100% to 50%
-- Pixtt Xxeric Kex hits for a max ~5,700; flurries; procs "Trample"; sees invisibility; but does not see Shroud of Stealth:
--
-- Pixtt Xxeric Kex at 50%
--
-- At 50% health, you see:
--
-- Raising her head to the sky, Xxeric lets out a battle cry that shakes the walls and calls forth a pack of raging ukun hounds. 'Prepare yourself for the afterlife this is the reality of the Mata Muram army.'
--
-- She begins casting her AEs:
-- Spirit Cleaver: Single Target, Prismatic (-350)
-- Wave of Rage: PB AE 100', Prismatic (-350)
-- She also begins AE rampaging (mitigated to ~1,000 per hit).
--
-- At this time, she also spawns four adds:
--
-- - 1x "an ukun juxtapincer"
-- - 1x "an ukun lifebleeder"
-- - 1x "an ukun manasipper"
-- - 1x "an ukun ragehound"
-- Spawn 298044 an ukun juxtapincer
-- Spawn 298043 an ukun lifebleeder
-- Spawn 298042 an ukun manasipper
-- Spanw 298041 an ukun ragehound
--
-- Each of these adds hits for a max ~3,000 and respawn twice as they are killed (for a total of 12 adds total, four at a time can be up at once).
--
-- Pixtt Xxeric Kex at 30% and Below
--
-- At 30%, she gains some strength:
-- Xxeric says, 'I commend you on your tenacity, infidels. However I am through playing games. Witness the true fighting power of an Ixt Berserker.'
--
--
-- When she hits 10%, she will regenerate to 40% health:
--
-- Xxeric says 'You may yet have the strength to defeat me but I am not through with you yet.' Xxeric's eyes turn blood red as she enters an uncontrollable rage. Focusing on her wounds, she begins to recover some health.
--
-- ...After which she can be killed.
--
--]]

local door = 0;
local entity_list = eq.get_entity_list();

local juxtapincer = 4;
local lifebleeder = 4;
local manasipper  = 4;
local ragehound   = 4;

local inst_id = 0;

function PXK_Spawn(e)
  e.self:SetPseudoRoot(true);
  eq.set_next_hp_event(98);
  eq.get_entity_list():FindDoor(2):SetLockPick(0);
end

function PXK_Death(e)
  local door = 0;
  door = entity_list:FindDoor(3);
  if (door ~= nil) then
    door:SetLockPick(0);
  end

  door = entity_list:FindDoor(4);
  if (door ~= nil) then
    door:SetLockPick(0);
  end

  eq.signal(298223, 298039);
  eq.get_entity_list():FindDoor(2):SetLockPick(0);
end

function PXK_Combat(e)
  if (e.joined == true) then
    e.self:Say("Have at you intruder. This is the domain of the commander and only those strong enough to beat me shall pass.");
  else 
    -- Wipe mechanics
    -- Depop adds, repop myself
    eq.depop_all(298044);
    eq.depop_all(298043);
    eq.depop_all(298042);
    eq.depop_all(298041);
    eq.spawn2(298039,0,0,151,-162,-6,192.5);
    eq.depop();

    -- reset the pet event counters in case of a wipe.
    juxtapincer = 0;
    lifebleeder = 0;
    manasipper  = 0;
    ragehound   = 0;

    eq.get_entity_list():FindDoor(2):SetLockPick(0);
  end
end

function PXK_Hp(e)
   --98pct
   if (e.hp_event == 98) then
      --locks door leading into her chamber
      door = entity_list:FindDoor(2);
      if (door ~= nil) then door:SetLockPick(-1); end
      e.self:Emote("begins to froth at the mouth as her skin becomes more rigid and her rage begins to grow. You feel a force from behind you as the door is once again sealed.");
      eq.set_next_hp_event(90);

      juxtapincer = 0;
      lifebleeder = 0;
      manasipper  = 0;
      ragehound   = 0;
   end

   --90pct unroot
   if (e.hp_event == 90) then
      e.self:SetPseudoRoot(false);
      e.self:CastSpell(4729, e.self:GetTarget():GetID());
      e.self:AddAISpell(0, 4729, 1, -1, -1, -350);
      eq.set_next_hp_event(50);
   end

   -- At 50% you see
   if (e.hp_event == 50) then
      e.self:Emote("The froth around her mouth thickens as she channels the force of her growing rage into each attack, sacrificing her thickened skin.");
      -- she begins casting Spirit Cleaver & Wave of Rage
      -- void AddAISpell(int priority, int spell_id, int type, int mana_cost, int recast_delay, int resist_adjust);
      e.self:AddAISpell(0, 4728, 1, -1, -1, -350);
      -- Begins to AE Ramp (r or 4)
      -- Ends Flurry (F or 5)
      e.self:SetSpecialAbility(SpecialAbility.flurry, 1);
      e.self:SetSpecialAbility(SpecialAbility.area_rampage, 1);
      e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 15); 

      eq.set_next_hp_event(45);
   end

   if (e.hp_event == 45) then
      eq.zone_emote(15,"Raising her head to the sky, Xxeric lets out a battle cry that shakes the walls and calls forth a pack of raging ukun hounds. 'Prepare yourself for the afterlife this is the reality of the Mata Muram army.'");

      -- Spawn the Pets
      eq.spawn2(298044,0,0, 151, -113, -6.87, 157);
      eq.spawn2(298043,0,0, 151, -218, -6.87, 225);
      eq.spawn2(298042,0,0,  81, -113, -6.87,  97);
      eq.spawn2(298041,0,0,  81, -218, -6.87,  20);

      eq.set_next_hp_event(30);
   end
   --Below 30%
   if (e.hp_event == 30) then
      --At 30%, she gains some strength:
      --Emotes at 30% and DPS picks up.
      eq.modify_npc_stat("min_hit", "1355");
      eq.modify_npc_stat("max_hit", "6200");
      e.self:Say("I commend you on your tenacity, infidels. However I am through playing games. Witness the true fighting power of an Ixt Berserker.");
      eq.set_next_hp_event(10);
   end

   --10%
   if (e.hp_event == 10) then
   --When she hits 10%, she will regenerate to 40% health and strip her debuffs
      -- Balance of the nameless, strip self debuffs
      e.self:CastSpell(3230,e.self:GetID());
      e.self:SetHP(e.self:GetMaxHP()*0.40)
      eq.modify_npc_stat("min_hit", "1315");
      eq.modify_npc_stat("max_hit", "5400");
      e.self:Say("You may yet have the strength to defeat me but I am not through with you yet.");
      e.self:Emote("'s eyes turn blood red as she enters an uncontrollable rage. Focusing on her wounds, she begins to recover some health.");
   end
end

function PXK_Juxtapincer_Death(e)
  if ( juxtapincer < 3 ) then
    juxtapincer = juxtapincer + 1;
    eq.spawn2(298044,0,0, 151, -113, -6.87, 157);
    e.self:Emote("flesh and bones are reformed by dark magic");
  end
end

function PXK_Lifebleeder_Death(e)
  if (lifebleeder < 3) then
    lifebleeder = lifebleeder + 1;
    eq.spawn2(298043,0,0, 151, -218, -6.87, 225);
    e.self:Emote("flesh and bones are reformed by dark magic");
  end
end

function PXK_Manasipper_Death(e)
  if (manasipper < 3) then
    manasipper = manasipper + 1;
    eq.spawn2(298042,0,0,  81, -113, -6.87,  97);
    e.self:Emote("flesh and bones are reformed by dark magic");
  end
end

function PXK_Ragehound_Death(e)
  if (ragehound < 3) then
    ragehound = ragehound + 1;
    eq.spawn2(298041,0,0,  81, -218, -6.87,  20);
    e.self:Emote("flesh and bones are reformed by dark magic");
  end
end

function event_encounter_load(e)
  inst_id = eq.get_zone_instance_id();

  eq.register_npc_event('pxk', Event.spawn,  298039, PXK_Spawn);
  eq.register_npc_event('pxk', Event.combat, 298039, PXK_Combat);
  eq.register_npc_event('pxk', Event.hp,     298039, PXK_Hp);

  eq.register_npc_event('pxk', Event.death_complete, 298044, PXK_Juxtapincer_Death);
  eq.register_npc_event('pxk', Event.death_complete, 298043, PXK_Lifebleeder_Death);
  eq.register_npc_event('pxk', Event.death_complete, 298042, PXK_Manasipper_Death);
  eq.register_npc_event('pxk', Event.death_complete, 298041, PXK_Ragehound_Death);

  eq.register_npc_event('pxk', Event.death_complete, 298039, PXK_Death);
end

function event_encounter_unload(e)
    eq.depop_all(298044);
    eq.depop_all(298043);
    eq.depop_all(298042);
    eq.depop_all(298041);
    eq.depop_all(298039);
end
