function event_combat(e)
  if (e.joined == true) then
    e.self:CastSpell(5727, e.self:GetTarget():GetID());
  end
end
