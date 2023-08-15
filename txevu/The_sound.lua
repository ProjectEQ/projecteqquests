function event_combat(e)
  if e.joined then
    e.self:Emote("of battle echoes from down the long hallways ahead of you.");
    eq.depop_with_timer();
  end
end
