-- Encounter: LDoN Raid: Deepest Guk: Ritualist of Hate
-- Zone: gukg / 259
--
local instance_requests = require("instance_requests"); 
local instance_id;
local lockout_name = 'LDON_gukg';
local lockout_length = 108;
local lockout_bit;
local lockouts;
local raid;
local qglobals;

function Zone_Spawn(e)
  lockouts = {
    [259047] = { 'GUKG_Leklos', 1, Spawn_Leklos },
    [259129] = { 'GUKG_Creeper', 2, Spawn_Creeper },
    [259135] = { 'GUKG_Spore', 4, Spawn_Spore },
    [259151] = { 'GUKG_Gragna', 8, Spawn_Gragna },
    [259154] = { 'GUKG_Keeper', 16, Spawn_Keeper }
  }

  qglobals = eq.get_qglobals();
  instance_id = eq.get_zone_instance_id();
  raid = eq.get_characters_in_instance(instance_id);
  lockout_bit = tonumber(qglobals[instance_id .. "_gukg_bit"]);
  if (lockout_bit == nil) then
    lockout_bit = 0 
    eq.set_global(instance_id .. "_gukg_bit", tostring(lockout_bit), 7, "H6");
  end

  if (bit.band(lockout_bit, 1) == 0 ) then
    Spawn_Leklos();
  elseif (bit.band(lockout_bit, 2) == 0 ) then  
    Spawn_Creeper();
  elseif (bit.band(lockout_bit, 4) == 0 ) then  
    Spawn_Spore();
  elseif (bit.band(lockout_bit, 8) == 0 ) then  
    Spawn_Gragna();
  elseif (bit.band(lockout_bit, 16) == 0 ) then  
    Spawn_Keeper();
  end
end

function Zone_Signal(e)
  if ( lockouts[e.signal] ~= nil ) then
    Update_Lockout( lockouts[ e.signal ] );
  end
end

function Update_Lockout(lockout)
  local qglobals = eq.get_qglobals();
  local name = lockout[1];
  local lockout_bit  = lockout[2];
  local current_bit = tonumber(qglobals[instance_id.."_gukg_bit"]);    
  local new_bit = tostring(bit.bor(current_bit,lockout_bit));

  eq.set_global(instance_id.."_gukg_bit", new_bit,7,"H6");
end

function Spawn_Leklos()
  eq.spawn2(259047, 0, 0, 583, -70, 2.13, 184);
end

function Spawn_Creeper()
  eq.spawn2(259129, 0, 0, -97, 328, -23, 130);
end

function Leklos_Death(e)
  eq.signal(259159, 259047);
  Spawn_Creeper();
  e.self:Emote(" falls to the ground a lifeless pile of bones.");
end

function Spawn_Spore()
  eq.spawn2(259135, 0, 0, -160, 1034, -97, 136);
end

function Creeper_Death(e)
  eq.signal(259159, 259129);
  eq.spawn2(259136, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()+5, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()+10, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()+15, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()+20, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX(), e.self:GetY() + 5, e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()-5, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()-10, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()-15, e.self:GetY(), e.self:GetZ(), 0);
  eq.spawn2(259136, 0, 0, e.self:GetX()-20, e.self:GetY(), e.self:GetZ(), 0);
  Spawn_Spore();
end

function Spawn_Gragna()
  eq.spawn2(259151, 0, 0, -339, 497, -2, 0);
end

function Spore_Death(e)
  eq.signal(259159, 259135);
  Spawn_Gragna();
end

function Spawn_Keeper()
  eq.spawn2(259154, 0, 0, -723, 766, -27, 57);
end

function Gragna_Death(e)
  eq.signal(259159, 259151);
  Spawn_Keeper();
end

function Keeper_Death(e)
  eq.signal(259159, 259154);

  -- Bidip`s Ornate Chest
  eq.spawn2(259158, 0, 0, -725, 786, -27, 57);

  -- Cursed Keepers` Slimy Chest
  eq.spawn2(259155, 0, 0, -722, 756, -27, 57);

  -- Gragna`s Worn Chest
  eq.spawn2(259156, 0, 0, -689, 734, -27, 57);

  -- Leklos` Bonepile
  eq.spawn2(259157, 0, 0, -674, 814, -27, 164);

  for k,v in pairs(raid) do
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(lockout_length)), "H" .. lockout_length, 0, v, 0);
  end

end

function event_encounter_load(e)
  eq.register_npc_event('gukg', Event.spawn,  259159, Zone_Spawn);
  eq.register_npc_event('gukg', Event.signal, 259159, Zone_Signal);

  eq.register_npc_event('gukg', Event.death_complete, 259047, Leklos_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259129, Creeper_Death)
  eq.register_npc_event('gukg', Event.death_complete, 259135, Spore_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259151, Gragna_Death);
  eq.register_npc_event('gukg', Event.death_complete, 259154, Keeper_Death);
end
