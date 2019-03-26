function event_combat(e)
  if (e.joined == true) then
    e.self:CastSpell(2817, 0); -- Spell: Thought Vortex
    eq.depop_with_timer();
  end
end
