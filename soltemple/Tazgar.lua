function event_say(e)
  if(e.message:findi("hail")) then
    e.other:Faction(415,-50,0); -- Temple of Solusek Ro
  end
end
