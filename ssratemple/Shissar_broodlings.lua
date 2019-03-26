function event_combat(e)
  if (e.joined == true) then
    e.self:CastSpell(2902,e.self:GetTarget():GetID()); -- Spell: Shissar Broodling Poison
    eq.depop_with_timer();
  end
end
