local function time_left(e)
  local ttime = eq.get_instance_timer();
  local day = math.floor(ttime / 86400000); 
  local hour = math.floor(ttime / 3600000) % 24;
  local minute = math.floor(ttime / 60000) % 60;
  local second = math.floor(ttime / 1000) % 60;
  local time_left;

  if (day>0) then
    time_left = string.format("Your instance will expire in %d days, %d hours, %d minutes, and %d seconds.", day, hour, minute, second);
  elseif (hour>0) then
    time_left = string.format("Your instance will expire in %d hours, %d minutes, and %d seconds.", hour, minute, second);
  elseif (minute>0) then 
    time_left = string.format("Your instance will expire in %d minutes, and %d seconds.", minute, second);
  elseif (second>0) then
    time_left = string.format("Your instance will expire in %d seconds.", second);
  end
  if (ttime>0) then
    eq.zone_emote(MT.Default, time_left);
  end
end

return time_left;
