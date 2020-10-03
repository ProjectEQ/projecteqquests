local size = 16
local next_hp_event = 90

function event_spawn(e)
  eq.set_next_hp_event(next_hp_event)
end

function event_death_complete(e)
  eq.signal(237743, 3) -- Durgin-Skell (bone golem event complete)
end

function event_hp(e)
  if e.hp_event == next_hp_event then
    eq.get_entity_list():MessageClose(e.self, true, 100, 15, "Fragments of body parts splinter from the golem and shower the floor.  Within moments, these pieces of ossified bone reassemble with scattered debris to form something else.")
    size = size - 1
    e.self:ChangeSize(size)
    next_hp_event = next_hp_event - 10
    if next_hp_event > 20 then
      eq.set_next_hp_event(next_hp_event)
    end

    -- todo: should also randomly spawn a_splinterbone_dervish instead (not in db)
    -- adds are spawned randomly with +/- 20 variance around boss
    local x = e.self:GetX() + math.random(-20, 20)
    local y = e.self:GetY() + math.random(-20, 20)
    eq.spawn2(237792, 0, 0, x, y, e.self:GetZ(), 511) -- #a_splinterbone_skeleton
  end
end
