local crystal_regen = 0;

function event_spawn(e)
	eq.set_timer('reset', 600 * 1000); --10 minute reset
end

function event_combat(e)
  if e.joined then
    eq.set_timer('Tadds', 60 * 1000);
		eq.stop_timer('reset');
  else
    eq.stop_timer('Tadds');
	eq.set_timer('reset', 600 * 1000); --10 minute reset
  end
end

function event_timer(e)
  if (e.timer == 'Tadds') then
    local xloc = e.self:GetX();
    local yloc = e.self:GetY();
    local zloc = e.self:GetZ();
    local heading = e.self:GetHeading();
    
    eq.spawn2(300065,0,0,559,136,-4,39); -- NPC: a_raging_feran
    eq.spawn2(300062,0,0,559,136,-4,39); -- NPC: a_snarling_feran
	elseif (e.timer == 'reset') then
		eq.stop_timer('reset');
		eq.signal(300085,3);
  end
end

function event_signal(e)
  if (e.signal == 80) then
    crystal_regen = crystal_regen + 1;
  end
  if (crystal_regen == 4) then
    e.self:ModifyNPCStat("hp_regen", "500");
    crystal_regen = 0;
  end
end

function event_death_complete(e)
eq.signal(300085,2);
end
