function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("turn the corner, you bear witness to a frigid creature down the hall, waiting for you to come closer so that it might show you misery.");
    eq.spawn2(128099, 0, 0, 623, -1202, -444, 0); -- NPC: Forbidding_Gargoyle
    eq.depop_with_timer();
  end
end
