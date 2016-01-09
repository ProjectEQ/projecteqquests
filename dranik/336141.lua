function event_spawn(e)
  e.self:SetPseudoRoot(true);
  eq.set_next_hp_event(85);

  -- Aura of Rage if its in the list
  e.self:RemoveAISpell(887);
  -- Add Zun`Muram Terror (silence)
  e.self:AddAISpell(5821, 0, 0, 0, 0, 0);
  -- Add Rage of Zun`Muram
  e.self:AddAISpell(6096, 0, 0, 0, 0, 0);
end

function event_hp(e)
  if (e.hp_event == 85) then
    e.self:SetPseudoRoot(false);
    -- Add Aura of Rage
    e.self:AddAISpell(887, 0, 0, 0, 0, 0);
    -- Remove Zun'Muram Terror (silence)
    e.self:RemoveAISpell(5821);
  end
end
