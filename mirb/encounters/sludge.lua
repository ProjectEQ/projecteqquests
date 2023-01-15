local box = require("aa_box")
local leash = { left=280, top=95, right=80, bottom=-105 }
local leash_box = box(leash.top, leash.bottom, leash.right, leash.left)

local slippery_dead_count = 0

function sundering_spawn(e)
  -- sundering sludge is leashed, not tethered (wipes hate list and doesn't restore hp)
  e.self:SetSpecialAbility(SpecialAbility.tether, 0) -- remove tether
end

function sundering_combat(e)
  if e.joined then
    eq.set_timer("leash_check", 5000)
  else
    eq.stop_timer("leash_check")
  end
end

function sundering_timer(e)
  if e.timer == "leash_check" then
    if not leash_box:contains(e.self:GetX(), e.self:GetY()) then
      e.self:WipeHateList()
      e.self:GotoBind()
    end
  end
end

-- when a sludge splits one spawns at location of "parent" and others have
-- random variance (can't do this on emu since they might spawn in walls)
function sundering_death(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  local z = e.self:GetZ()

  eq.spawn2(237788, 0, 0, x, y, z, 511) -- #a_severing_sludge
  eq.spawn2(237788, 0, 0, x, y, z, 511) -- #a_severing_sludge
  eq.spawn2(237788, 0, 0, x, y, z, 511) -- #a_severing_sludge
  eq.spawn2(237788, 0, 0, x, y, z, 511) -- #a_severing_sludge
end

function severing_death(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  local z = e.self:GetZ()

  eq.spawn2(237787, 0, 0, x, y, z, 511) -- #a_slippery_sludge
  eq.spawn2(237787, 0, 0, x, y, z, 511) -- #a_slippery_sludge
  eq.spawn2(237787, 0, 0, x, y, z, 511) -- #a_slippery_sludge
  eq.spawn2(237787, 0, 0, x, y, z, 511) -- #a_slippery_sludge
end

function slippery_death(e)
  slippery_dead_count = slippery_dead_count + 1
  eq.debug("slippery sludge count: " .. slippery_dead_count)
  if slippery_dead_count == 16 then
    eq.signal(237743, 1) -- Durgin_Skell (sludge event complete)
  end
end

function event_encounter_load(e)
  eq.register_npc_event("sludge", Event.spawn, 237748, sundering_spawn)          -- a_sundering_sludge
  eq.register_npc_event("sludge", Event.combat, 237748, sundering_combat)        -- a_sundering_sludge
  eq.register_npc_event("sludge", Event.timer, 237748, sundering_timer)          -- a_sundering_sludge
  eq.register_npc_event("sludge", Event.death_complete, 237748, sundering_death) -- a_sundering_sludge
  eq.register_npc_event("sludge", Event.death_complete, 237788, severing_death)  -- #a_severing_sludge
  eq.register_npc_event("sludge", Event.death_complete, 237787, slippery_death)  -- #a_slippery_sludge
end
