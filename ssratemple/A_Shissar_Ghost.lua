function event_combat(e)
  if (e.joined == true) then
    e.self:CastSpell(2904,e.self:GetTarget():GetID()); -- Spell: Serpentine Curse
    eq.depop_with_timer();
  end
end
