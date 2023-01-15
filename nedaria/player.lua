--sub EVENT_FISH_SUCCESS {
--	if($client->GetGlobal("paladin_epic")==3) {
--		if($fished_item==69914) {
--			$client->Message(1,"As you reel in the dark fish's scale, you notice a large fish in the water");
--			quest::depopall(182150);
--			quest::spawn2(182150,0,0,1781,1033,38.6,400); # NPC: #A_Corrupted_Koalindl
--		}
--	}
--}

function event_fish_success(e)
	if(e.item:GetID() == 69914) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["paladin_epic"] == "3") then
				e.self:Message(15, "As you reel in the dark fish's scale, you notice a large fish in the water");
				eq.depop_all(182150);
				eq.spawn2(182150,0,0,1781,1033,38.6,400); --#A_Corrupted_Koalindl
		end
	end
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 9) then
    e.self:MovePCDynamicZone("fhalls")
  end
end
