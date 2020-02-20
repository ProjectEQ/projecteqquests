function event_combat(e)
  if (e.joined == true) then
    e.self:Emote("chanting seems to be coming from all directions.");
    eq.depop_with_timer();
  end
end
