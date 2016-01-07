-- When a client loots a 
--  Copper Seal of Subversion,
--  Silver Seal of Subversion, or a 
--  Gold Seal of Subversion;
-- Send a signal to the Master of Destruction so he can
-- tally up the points associated with the various seals
-- to opperate he event.
function event_loot(e)
  if (e.item:GetID() == 52171) then
    -- Coper Seal of Subversion 
    eq.signal(306001, 1);
  elseif (e.item:GetID() == 52172) then
    -- Silver Seal of Subversion
    eq.signal(306001, 2);
  elseif (e.item:GetID() == 52173) then
    -- Gold Seal of Subversion
    eq.signal(306001, 3);
  end
end
