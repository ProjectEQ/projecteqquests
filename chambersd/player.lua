function event_enter_zone(e)
  local cg = eq.get_qglobals(e.self);
  if (cg["mpg_raid_trial_won"] ~= nil and cg['mpg_raid_trial_won'] ~= 0) then
    eq.debug('mpg_raid_trial_won: ' .. tostring(cg['mpg_raid_trial_won']) );
    local mpg_helper = require("mpg_helper");
    mpg_helper.RaidAnguishAccess(e.self, cg['mpg_raid_trial_won']);
    eq.target_global('mpg_raid_trial_won', '0', 'S1', 0, e.self:CharacterID(), 0);
  end
end
function event_loot(e)
  if (e.item:GetID() == 56016 and e.corpse:GetNPCTypeID() == 307005) then
    if (e.self:GetGlobal("cleric20_mpg_drop") == "1") then
      e.self:DelGlobal("cleric20_mpg_drop");
      return 0;
    else
      return 1;
    end
  end
end
