function event_loot(e)
  if (e.item:GetID() == 56016 and e.corpse:GetNPCTypeID() == 308004) then
    if (e.self:GetGlobal("cleric20_mpg_drop") == "1") then
      e.self:DelGlobal("cleric20_mpg_drop");
      return 0;
    else
      return 1;
    end
  end
end

