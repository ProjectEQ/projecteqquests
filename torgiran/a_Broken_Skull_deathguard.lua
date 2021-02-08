function event_death_complete(e)
if(e.self:GetSp2() == 282505) then --spawn group inside the overlord room
eq.signal(226204,1); --#overlord_trigger (226204) to add to wave counter
end
end
