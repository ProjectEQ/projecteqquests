function event_player_pickup(e)
  if (e.item:GetID() == 52154) then
    --polished silvery key
    eq.signal(282116,1);
  end
end
