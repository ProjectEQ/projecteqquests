--[[
-- PKK Event
-- Pixtt Kretv Krakxt
-- http://everquest.allakhazam.com/db/quest.html?quest=4262
--
-- Pixtt Kretv Krakxt says 'You shall regret trespassing into my chambers. The might of our kind shall smother the flames of life in this world, starting with you.' 
--
-- Do you really think your paltry skills will be enough to best a being as powerful as I? 
--
--
-- Pixtt Kretv Krakxt: Fight Details & Mechanics 
--
-- Pixtt Kretv Krakxt hits for a max ~4,800. During this encounter, she will "feign death" four different times: Once at 90%, 70%, 50%, and 30%. Each time she does this, numerous mobs called "an ikaav hatchling" spawn and must be killed to progress the event. These adds each hit for a max ~1,500; single-target rampage; and are mezzable. Also appearing at this time are non-attackable mobs called "Reflection of Pixtt Kretv Krakxt" that wander the perimeter of the room casting AEs. 
--
--
-- Pixtt Kretv Krakxt at 90% 
--
-- Ha ha ha, you fools thought you could overpower me. You are nothing but food for my offspring. Come my children, strike them down and suck the marrow from their bones.' Kretv's body falls to the ground -- a lifeless husk freeing the hatchlings within. 
--
-- 4x "an ikaav hatchling" spawn and 1x "Reflection of Pixtt Kretv Krakxt" (unattackable) roams the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people. After the four hatchlings are dead, Pixtt Kretv Krakxt resumes attacking. 
--
-- Each hatchling is stunnable and mezzable, and has about 50,000 hitpoints. 
--
--
-- Pixtt Kretv Krakxt at 70% 
--
-- Your efforts shall fail no matter how great. This is a reality you shall soon see as your vile existence ceases and my brood consumes your remains. 
--
-- 5x "an ikaav hatchling" spawn and 2x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people. After the five hatchlings are dead, Pixtt Kretv Krakxt resumes attacking. 
--
--
-- Pixtt Kretv Krakxt at 50% 
--
-- You show surprising strength and conviction, but you will not get any further. The time has come for you to be destroyed. 
--
-- 6x "an ikaav hatchling" spawn and 3x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people and "Ikaav Venom" (AE slow). After the six hatchlings are dead, Pixtt Kretv Krakxt resumes attacking. 
--
--
-- Pixtt Kretv Krakxt at 30% 
--
-- My resolve is waning but I shall fight you to the very last breath. The commander looks down upon weaklings in his ranks and the ikaav are not ones to indulge in it. 
--
-- 7x "an ikaav hatchling" spawn and 4x "Reflection of Pixtt Kretv Krakxt" (unattackable) roam the perimeter of the room casting "Wrath of the Ikaav" (7k DD + Feign Death) on random people and "Ikaav Venom" (AE slow). After the seven hatchlings are dead, Pixtt Kretv Krakxt resumes attacking. 
--
--
-- Pixtt Kretv Krakxt at 10% 
--
-- At approximately 10%, you see this: 
--
-- The end is inevitable, but if I must be defeated, some of you will join me in the afterlife. 
--
-- At this time, Pixtt Kretv Krakxt begins AE rampaging for full damage, and won't stop until her death. Also at this point, you get 3x "an ikaav hatchling" adds. 
--
--
-- Completion & Loot 
--
-- Pixtt Kretv Krakxt has been slain by _____! 
--
-- Kretv's body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room. 'This is not over. My commander will destroy you for this and when he does I hope it is my power he is wielding. 
--
-- With the death of the great beast, the seals on the doors fade away. Your path is now clear. 
--
-- The remaining hatchlings do not despawn upon her death. They must be killed. 
--
--]]
local PKK_active = "SERQMCNIDf"
local PKK_inactive = "ABfHG"

local hatchlings_spawned = 0;
local hatchlings_killed = 0;

local PKK_hitpoints = 100;

function PKK_Spawn(e)
  eq.set_next_hp_event(90);

  PKK_active = "SERQMCNIDf"
  PKK_inactive = "ABfHG"

  hatchlings_spawned = 0;
  hatchlings_killed = 0;

  PKK_hitpoints = 100;

end

function PKK_Death(e)
  eq.signal(298223, 298201);
  eq.get_entity_list():FindDoor(5):SetLockPick(0);
end

function PKK_Combat(e)
  if (e.joined == true) then
    e.self:Say("You shall regret trespassing into my chambers. The might of our kind shall smother the flames of life in this world, starting with you.");

    e.self:Say("Do you really think your paltry skills will be enough to best a being as powerful as I? ");
    eq.get_entity_list():FindDoor(5):SetLockPick(-1);
  elseif (e.joined == false) then
    eq.depop_all(298203);
    eq.depop_all(298204);
    eq.depop_all(298048);
    eq.spawn2(298201, 0, 0, 162.79, 241.47, -6.87, 188.8);
    eq.depop();
    eq.get_entity_list():FindDoor(5):SetLockPick(0);
  end
end

function Spawn_Hatchlings(number, x, y, z, h)
  hatchlings_spawned = number;
  hatchlings_killed = 0;

  eq.spawn2(298048,0,0,x+15, y+15, z, h);
  eq.spawn2(298048,0,0,x+15, y-15, z, h);
  eq.spawn2(298048,0,0,x-15, y-15, z, h);

  if (number >= 4) then 
    eq.spawn2(298048,0,0,x-15, y+15, z, h);
  end

  if (number >= 5) then
    eq.spawn2(298048,0,0,x+7, y+15, z, h);
  end
  if (number >= 6) then
    eq.spawn2(298048,0,0,x+7, y+7, z, h);
  end
  if (number >= 7) then
    eq.spawn2(298048,0,0,x, y, z, h);
  end
end

function Spawn_Reflection(number, x, y, z, h)
  for i = 0, number -1, 1 do 
    eq.spawn2(298204, 93, 0, x-(i*20), y-(i*20), z, h);
  end
end

function PKK_Hp(e)
  PKK_hitpoints = e.hp_event;
  if (e.hp_event == 98) then

    eq.set_next_hp_event(90);

  elseif (e.hp_event == 90) then
    e.self:Say("Ha ha ha, you fools thought you could overpower me. You are nothing but food for my offspring. Come my children, strike them down and suck the marrow from their bones.");
    e.self:Emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");

    Spawn_Reflection(1, 123, 276, -6, 189.1);

    eq.modify_npc_stat("special_attacks", PKK_inactive);
    Spawn_Hatchlings(4, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
    e.self:SetAppearance(0);
    e.self:SetAppearance(3);

    eq.set_next_hp_event(70);

  elseif (e.hp_event == 70) then
    e.self:Say("Your efforts shall fail no matter how great. This is a reality you shall soon see as your vile existence ceases and my brood consumes your remains. ");
    e.self:Emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");

    eq.modify_npc_stat("special_attacks", PKK_inactive);
    Spawn_Hatchlings(5, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
    e.self:SetAppearance(0);
    e.self:SetAppearance(3);

    Spawn_Reflection(2, 123, 276, -6, 189.1);

    eq.set_next_hp_event(50);

  elseif (e.hp_event == 50) then
    e.self:Say("You show surprising strength and conviction, but you will not get any further. The time has come for you to be destroyed.");
    e.self:Emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");

    eq.modify_npc_stat("special_attacks", PKK_inactive);
    Spawn_Hatchlings(6, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
    e.self:SetAppearance(0);
    e.self:SetAppearance(3);

    Spawn_Reflection(3, 123, 276, -6, 189.1);

    eq.set_next_hp_event(30);

  elseif (e.hp_event == 30) then

    e.self:Say("My resolve is waning but I shall fight you to the very last breath. The commander looks down upon weaklings in his ranks and the ikaav are not ones to indulge in it.");
    e.self:Emote("body falls to the ground -- a lifeless husk freeing the hatchlings within.");

    eq.modify_npc_stat("special_attacks", PKK_inactive);
    Spawn_Hatchlings(7, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
    e.self:SetAppearance(0);
    e.self:SetAppearance(3);

    Spawn_Reflection(4, 123, 276, -6, 189.1);

    eq.set_next_hp_event(10);

  elseif (e.hp_event == 10) then

    Spawn_Hatchlings(3, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 189.1);
    eq.modify_npc_stat("special_attacks", PKK_active .. "r" );

  end
end

function PKK_Hatchling_Death(e)
  hatchlings_killed = hatchlings_killed + 1;
  if ( hatchlings_killed >= hatchlings_spawned ) then
    eq.signal(298201, 1);
    eq.signal(298203, 1);
    eq.signal(298204, 1);
  end
end

function PKK_Signal(e)
  if (e.signal == 1) then
    e.self:SetAppearance(0);
    eq.modify_npc_stat("special_attacks", PKK_active);
  end
end

function PKK_Roaming_Caster_One_Spawn(e)
  eq.start(93);
  eq.set_timer('snake1', eq.ChooseRandom(1,5,10,15,20,25) * 1000);
end

function PKK_Roaming_Caster_One_Timer(e)
  eq.stop_timer(e.timer);
  local client = eq.get_entity_list():GetRandomClient(162, 241, -7, 180*180);
  e.self:DoAnim(44);
  
  local spell;

  if (PKK_hitpoints <= 50) then 
    spell = eq.ChooseRandom(888, 751);
  else 
    spell = 888;
  end

  e.self:CastSpell(spell, client:GetID());

  eq.set_timer(e.timer, eq.ChooseRandom(5,10,15,20,25) * 1000);
end

function PKK_Roaming_Caster_One_Signal(e)
  eq.depop();
end

function event_encounter_load(e)
  eq.register_npc_event('pkk', Event.spawn,          298201, PKK_Spawn);
  eq.register_npc_event('pkk', Event.combat,         298201, PKK_Combat);
  eq.register_npc_event('pkk', Event.hp,             298201, PKK_Hp);
  eq.register_npc_event('pkk', Event.timer,          298201, PKK_Timer);
  eq.register_npc_event('pkk', Event.death_complete, 298201, PKK_Death);
  eq.register_npc_event('pkk', Event.signal,         298201, PKK_Signal);

  eq.register_npc_event('pkk', Event.death_complete, 298048, PKK_Hatchling_Death);

  eq.register_npc_event('pkk', Event.spawn,          298204, PKK_Roaming_Caster_One_Spawn);
  eq.register_npc_event('pkk', Event.timer,          298204, PKK_Roaming_Caster_One_Timer);
  eq.register_npc_event('pkk', Event.signal,         298204, PKK_Roaming_Caster_One_Signal);
end

function event_encounter_unload(e)

end
