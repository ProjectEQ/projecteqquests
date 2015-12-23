function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("Do you wish to [" .. eq.say_link('leave', false, 'leave') .. "] this trial?");
  elseif (e.message:findi("leave")) then
    e.other:MovePC(316,-928, 404, -306, 135); 
  end
end

