function event_combat(e)
  if (e.joined == true) then
    e.self:CastSpell(2903,e.self:GetTarget():GetID()); -- Spell: Breath of the Shissar
    eq.depop_with_timer();
  end
end
