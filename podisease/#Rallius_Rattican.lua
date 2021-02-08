function event_combat(e)
  if (e.joined == true) then
    eq.set_timer("spider", 2 * 1000);
  else
    eq.stop_timer("spider");
    eq.stop_timer("spiders");
  end
end

function event_timer(e)
  if (e.timer == "spider") then
    eq.spawn2(205161, 0, 0, 108, -3384, -220, 357); -- NPC: A_gargantuan_arachnae
    eq.spawn2(205161, 0, 0, 108, -3384, -220, 357); -- NPC: A_gargantuan_arachnae
    eq.stop_timer("spider");
    eq.set_timer("spiders", 300 * 1000);
  elseif (e.timer == "spiders") then
    eq.spawn2(205161, 0, 0, 108, -3384, -220, 357); -- NPC: A_gargantuan_arachnae
    eq.spawn2(205161, 0, 0, 108, -3384, -220, 357); -- NPC: A_gargantuan_arachnae
    eq.stop_timer("spiders");
    eq.set_timer("spiders", 300 * 1000);
  end
end

function event_death_complete(e)
eq.depop_all(205161);
eq.depop_all(205162);
end
