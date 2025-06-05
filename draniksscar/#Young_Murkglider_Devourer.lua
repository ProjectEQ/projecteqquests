 -- Spawngroup: 43327

function event_spawn(e)
  eq.set_timer('evolve', 14400 * 1000); -- 4 hours
end

function event_timer(e)
    if (e.timer == 'evolve') then
      eq.unique_spawn(302078,108,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Mature_Murkglider_Devourer
      eq.depop();
    end
end

function event_death_complete(e)
  eq.update_spawn_timer(43327, 14400 * 1000); -- 4 hours
end
