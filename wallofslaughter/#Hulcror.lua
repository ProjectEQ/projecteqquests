function event_combat(e)
  if (e.joined == true) then
    eq.set_timer("plague", 2 * 1000);
  else
    eq.stop_timer("plague");
  end
end

function event_timer(e)
  if (e.timer == "plague") then
    eq.stop_timer("plague");
    e.self:CastSpell(5713, e.self:GetTarget():GetID());
  end
end
