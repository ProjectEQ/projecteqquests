-- items: 60289, 60285, 60286, 60288, 60292
function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("Yeah, I'm Dardek. What d' ye want?! Can't ye see I'm not in t' mood fer talkin'? Bah, t' heck with ye. If'n ye get me a nice hot cup of m' favorite coffee, I might be willin' to talk with ye for a few minutes. Hurry up now, Coldain Coffee! It's t' only thing I'll drink!");
  end
end

function event_waypoint_arrive(e)
  if (e.self:GetX() > -120 and e.self:GetY() < -420) then
    e.self:Say("Alright then, what do ye have fer me? I’m certain ye didn’t wake me up and make me coffee just t’ see my glistening smile! What have ye got fer me?!");
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other);
  local item_lib = require("items");

  if (qglobals["warrior_pre"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 60289})) then -- Coldain Coffee Blend
    e.self:Say("Mmm, nothing like a nice hot cup of Thurgadin’s best. Alright then, let’s head over t’ my shop and we can get down t’ business!");
    -- Start pathing on Grid 31 to the forge.
    e.self:AssignWaypoints(31);
  end
  -- Hand him the three items:
  --
  -- Korbuk’s Weapon Plans      60285
  -- The Elegant Shank          60286
  -- Emblazoned Champion’s Hilt 60288
  --
  -- He will hand you in return “Dardek’s Forged Blade” (60292) Take it back to Korbuk in Dranik’s scar.
  --
  -- This turn in should only be able to be done when Dardek Bladewright is at the forge.
  -- X > -142 and Y < -402
  if (e.self:GetX() > -142 and e.self:GetY() < -402) then 
    if (qglobals["warrior_pre"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 60285, item2 = 60286, item3 = 60288})) then 
      eq.set_global("warrior_pre","5",5,"F");
      e.self:Say("Take this back to Korbuk Brimblade");
      e.other:SummonItem(60292); -- Item: Dardek's Forged Blade
      --e.self:Depop();
      eq.depop_with_timer(115253);
    end
  end
  item_lib.return_items(e.self, e.other, e.trade);
end
