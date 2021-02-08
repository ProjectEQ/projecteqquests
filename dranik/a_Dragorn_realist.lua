function event_signal(e)
  if (e.signal==1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
  end
end
