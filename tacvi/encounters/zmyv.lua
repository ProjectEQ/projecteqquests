--[[ 
-- Tacvi Encounter: Zun`Muram Yihst Vor
-- 298023
-- http://everquest.allakhazam.com/db/quest.html?quest=4266
--
-- The Encounter 
--
-- Zun`Muram Yihst Vor is a fairly straightforward fight. He is permanently rooted; summons when damaged; hits for a max ~4,500; single-target rampages; flurries; and has ~1.9 million hitpoints. No adds here, but he does cast a charm: 
--
-- Zun`Muram Yihst Vor says 'The weak willed and the idle will serve my cause.' 
--
-- Allure of Hatred: Single Target, Magic (-500) 
-- 1: Charm up to level 65 
-- 2: Increase ATK by 100 
-- 3: Increase Damage Shield by 50 
-- 4: Spell-Damage Shield (250) 
-- 5: Increase Attack Speed by 25% 
--
-- He also occasionally mem blurs, so be mindful of DPS aggro here. 
--
-- Considering his relative ease compared with other encounters in the zone, he does a lot of talking and taunting. At 90%, you see: 
--
-- Zun`Muram Yihst Vor says, 'Is this is the best you can do? Come now, show me your true strength and I will show you mine.' 
--
-- At 75%, you see: 
--
-- Zun`Muram Yihst Vor says, 'To think I was actually worried you might be worthy foes.'. 
--
-- At 50%, you see: 
--
-- Zun`Muram Yihst Vor says, 'Ahh, sweet pain. It is such an intoxicating feeling. I thank you for the pleasure. Now let me return the favor.' 
--
-- At 20%, you see (begins AE rampaging): 
--
-- Zun`Muram Yihst Vor's body bulges with strength as he enters a blind rage. 
--
-- Kill him to complete. 
--]]
function ZMYV_Spawn(e)
  eq.set_next_hp_event(90);
end

function ZMYV_Combat(e)
  if (e.joined == true) then
    eq.get_entity_list():FindDoor(21):SetLockPick(-1);
    e.self:Say("The weak willed and the idle will serve my cause.");
  else
    eq.set_timer("wipecheck", 1 * 1000);
  end
end

function ZMYV_Timer(e)
  if (e.timer == "wipecheck") then
    local client = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 8000);
    if (client:IsClient() == false) then
      -- Wipe Mechanics
      eq.get_entity_list():FindDoor(21):SetLockPick(0);
      eq.spawn2(298023, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
      eq.depop();
    end
  end
end

function ZMYV_Hp(e)
  if (e.hp_event == 90) then
    eq.set_next_hp_event(75);
    e.self:Say("Is this is the best you can do? Come now, show me your true strength and I will show you mine.' ");
  elseif (e.hp_event == 75) then
    eq.set_next_hp_event(50);
    e.self:Say("To think I was actually worried you might be worthy foes.");
  elseif (e.hp_event == 50) then
    eq.set_next_hp_event(20);
    e.self:Say("Ahh, sweet pain. It is such an intoxicating feeling. I thank you for the pleasure. Now let me return the favor.");
  elseif (e.hp_event == 20) then
    e.self:Emote("'s body bulges with strength as he enters a blind rage. ");
    e.self:NPCSpecialAttacks("SERFQMCNIDfr", 0);
  end
end

function ZMYV_Death(e)
  eq.signal(298223,298023);
  eq.get_entity_list():FindDoor(21):SetLockPick(0);
end

function event_encounter_load(e)
  eq.register_npc_event('zmyv', Event.spawn,          298023, ZMYV_Spawn); 
  eq.register_npc_event('zmyv', Event.combat,         298023, ZMYV_Combat); 
  eq.register_npc_event('zmyv', Event.timer,          298023, ZMYV_Timer); 
  eq.register_npc_event('zmyv', Event.hp,             298023, ZMYV_Hp); 
  eq.register_npc_event('zmyv', Event.death_complete, 298023, ZMYV_Death); 
end

function event_encounter_unload(e)
end
