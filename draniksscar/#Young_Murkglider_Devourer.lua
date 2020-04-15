 -- This script takes much longer on live but we reset every day, so its adapted to happen faster on PEQ
 -- Spawngroup: 43327

function event_spawn(e)
  eq.set_timer('evolve', 3600 * 1000);
end

function event_timer(e)
    if (e.timer == 'evolve') then
      eq.spawn2(302078,108,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: #Mature_Murkglider_Devourer
      eq.depop();
    end
end

function event_death_complete(e)
  eq.update_spawn_timer(43327, 3600 * 1000);
end
