--Ikkinz Group Trial #2: Twin Struggles 
local saved_hp = 25000;

function event_death_complete(e)
eq.zone_emote(0,"The constrained servitor is allowed to rest at last. The priests he was serving have been weakened by his death.");
eq.signal(294138,1); --signal #Malevolent_Priest (294138) to reduce hp
eq.signal(294629,1); --signal #Malevolent_Priest_ (294629) to reduce hp
end

function event_spawn(e)
  eq.set_timer("checkhp", 10 * 1000);
  saved_hp = 25000;
end

function event_timer(e)
  if saved_hp > e.self:GetHP() then
    e.self:SetOOCRegen(0); --turn off OOC regen since damage is being done
  elseif saved_hp == e.self:GetHP() then
    --no damage was done since last hp check, turn regen back on
    e.self:SetOOCRegen(2500);
  end
saved_hp = e.self:GetHP();
end
