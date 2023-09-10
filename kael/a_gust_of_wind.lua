
function event_combat(e)
  if e.joined then
    e.self:Emote("blows through the cavern.");
    eq.depop_with_timer();
  end
end
