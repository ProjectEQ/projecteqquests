
function event_combat(e)
  if e.joined then
    e.self:Emote("drips from the stalactite to the stalagmite.");
    eq.depop_with_timer();
  end
end
