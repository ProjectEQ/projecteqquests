-- npc id: 237797

function event_combat(e)
  if e.joined then
    eq.set_timer("check_banish", 5000)
  else
    eq.stop_timer("check_banish")
  end
end

function event_timer(e)
  if e.timer == "check_banish" then
    -- every 5s chance for target to be teleported to back of room and aggro wiped
    if math.random(2) == 1 then -- 50%, happens fairly frequently (17 times in 179s fight)
      local target = e.self:GetTarget()
      if target.valid then
        target:GMMove(256, 622, 65, 256) -- back of room
        -- e.self:RemoveFromHateList(target) -- todo: need api access to Mob::RemoveFromHateList
        eq.get_entity_list():RemoveFromHateLists(target)
      end
    end
  end
end

function event_death_complete(e)
  eq.signal(237743, 6) -- Durgin_Skell (boss dead, add lockout and spawn chests)
end
