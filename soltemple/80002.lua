-- items: 28051
local hour_low = 9;
local hour_high = 20;

function Check_Gender(e)
  local time = eq.get_zone_time();
  local hour = time['zone_hour'];

  if ( hour < hour_low or hour > hour_high ) then
    -- Woman
    e.self:SendIllusionPacket({race=1,gender=1,texture=11});
  else 
    -- Man
    e.self:SendIllusionPacket({race=1,gender=2,texture=11});
  end
end

function event_spawn(e)
  Check_Gender(e);
  eq.set_timer('check_gender', 30 * 1000);
end

function event_say(e)
  local time = eq.get_zone_time();
  local hour = time['zone_hour'];
  if ( hour >= hour_low and hour <= hour_high ) then
    if (e.message:findi("plasmatic priest")) then 
      e.self:Say("You speak of things that should not be spoken! It would be in your best interest to leave this temple at once and return to lands less consumed by flame!");
    elseif (e.message:findi("solusek ro")) then
      e.self:Say("Solusek Ro is the Master of Fire and the Keeper of Power.");
    end
  end
end

function event_timer(e)
  if (e.timer == 'check_gender') then
    Check_Gender(e);
  end
end

function event_trade(e)
  local item_lib = require("items");

  local time = eq.get_zone_time();
  local hour = time['zone_hour'];
  if ( hour >= hour_low and hour <= hour_high ) then
    if (item_lib.check_turn_in(e.trade, {item1 = 28051})) then --Coral Statue of Tarew
      e.self:Emote("shakes violently as his hand closes on the coral statue and flames dance in the depths of his eyes! The statue begins to emit a reddish glow then shatters in a burst of fire and smoke! The flames in the plasmatic priest's eyes vanish with the explosion and only madness remains!");
      e.self:Say("The Triumvirate thinks that destroying my spirit of flame will stop me?!! I will kill you all now, the goblins will continue to war, and when my spirit is restored I will ensure that Ixiblat Fer consumes all of Norrath in his flames!!");
      local priest = eq.spawn2(80042,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); -- NPC: a_plasmatic_priest
      eq.depop_with_timer();
    else
      item_lib.return_items(e.self, e.other, e.trade);
    end
  else
    item_lib.return_items(e.self, e.other, e.trade);
  end

end
