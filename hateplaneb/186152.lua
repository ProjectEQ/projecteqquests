--_Insanity (186152) emotes random things zonewide
function event_spawn(e)
  eq.set_timer("emote", 45 * 60 * 1000); -- 45 min
end

function event_timer(e)
  if(e.timer=="emote") then
  local rand = math.random(1,10);
    if (rand ==1) then
      eq.zone_emote(0, "A blood chilling cry echoes through the darkened streets");
    elseif (rand == 2) then
      eq.zone_emote(0, "An unseen presence whispers in your ear, 'Only the bravest or most foolish would find themselves invading the realm of Innoruuk.");
    elseif (rand == 3) then
      eq.zone_emote(0, "Brimming with rage, you can hardly wait until you are able to spill blood again.  In fact, you might not wait!  You never did like the way that person over there looked at you!");
    elseif (rand == 4) then
      eq.zone_emote(0, "Becoming paranoid, you glance at each of your party members in turn. Will one of them fail you? Who can you truly count on?");
    elseif (rand == 5) then
      eq.zone_emote(0, "The stench of rotting flesh is nauseating.");
    elseif (rand == 6) then
      eq.zone_emote(0, "You really hate this place.");
    elseif (rand == 7) then
      eq.zone_emote(0, "You would much rather be in a safe and warm inn than this hellish dimension.");
    elseif (rand == 8) then
      eq.zone_emote(0, "Peals of sinister laughter seem to come from all directions at once.");
    elseif (rand == 9) then
      eq.zone_emote(0, "You are overwhelmed with an unsettling sensation that eyes are peering at you from every shadow.");
    elseif (rand == 10) then
      eq.zone_emote(0, "An involuntary shiver ripples down your spine.");
    end
  end
end
