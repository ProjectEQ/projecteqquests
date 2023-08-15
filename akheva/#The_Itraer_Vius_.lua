function event_combat(e)
  if e.joined then
    e.self:CastSpell(2818, 0); -- Spell: Shadow Fog
    eq.depop_with_timer();
  end
end
