--trash ph in arena
function event_combat(e)
  if (e.joined == true) then
    eq.depop_with_timer();
  end
end
