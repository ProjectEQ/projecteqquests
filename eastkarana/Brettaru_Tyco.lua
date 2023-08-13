--BeginFile: eastkarana\Brettaru_Tyco.lua ()
--Quest file for East Karana - Brettaru Tyco

function event_say(e)
  if(e.message:findi("hail")) then
    if(eq.is_task_activity_active(811,2)) then -- Task: Bringing Goods to the Plains
      e.self:Say(string.format("Hello, %s.",e.other:GetName()));
      e.self:Message(MT.Yellow, "Now wasn't that a rewarding experience? Wasn't it satisfying to expand your horizons and explore the world? Truely, your time spent here is reward in and of itself. Then again, if it's not, you did go see the world on the word of a stranger, so there's no harm in a reward that's a bit more tangible.");
      eq.update_task_activity(811,2,1);
    elseif(eq.is_task_activity_active(500143,2)) then -- Task: Bringing Books to the Karanas
      e.self:Say(string.format("Hello, %s.",e.other:GetName()));
      e.self:Message(MT.Yellow, "Now wasn't that a rewarding experience? Wasn't it satisfying to expand your horizons and explore the world? Truely, your time spent here is reward in and of itself. Then again, if it's not, you did go see the world on the word of a stranger, so there's no harm in a reward that's a bit more tangible.");
      eq.update_task_activity(500143,2,1);
    end
  else
    e.self:Say(string.format("Hello, %s.",e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib = require("items");
  item_lib.return_items(e.self, e.other, e.trade)
end



-- EndFile: eastkarana\Brettaru_Tyco.lua ()
