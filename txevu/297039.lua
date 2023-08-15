--trash ph in arena
function event_combat(e)
  if e.joined then
    eq.depop_with_timer();
  end
end
