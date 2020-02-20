
function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("nearly jumps onto the ice.");
    eq.depop_with_timer();
  end
end
