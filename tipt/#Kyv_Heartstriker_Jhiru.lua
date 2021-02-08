local box = require("aa_box")
local leash_box = box(2400, 2100, 420, 900)
local leashed = false

function event_combat(e)
 if e.joined then
   eq.set_timer("check_leash", 1000)
 else
   e.self:ModifyNPCStat("max_hit", "1800")
   e.self:ModifyNPCStat("min_hit", "660")
   eq.stop_timer("check_leash")
   leashed = false
 end
end

function event_timer(e)
  if not leashed and not leash_box:contains(e.self:GetX(), e.self:GetY()) then
    eq.get_entity_list():MessageClose(e.self, true, 100, 13, e.self:GetCleanName() .. " gnashes his teeth in anger as he redoubles his efforts to slay you.")
    e.self:ModifyNPCStat("max_hit", "3221")
    e.self:ModifyNPCStat("min_hit", "1183")
    leashed = true
  end
end

function event_death_complete(e)
  eq.stop_timer("check_leash")

  local dz = eq.get_expedition()
  if dz.valid then
    dz:SetLocked(true, ExpeditionLockMessage.Close)
  end

  eq.spawn2(289032, 0, 0, 1408, 2111, 731.73, 261) -- NPC: #Master_Stonespiritist_Okkanu
end
