function event_click_door(e)
	local seventh_hammer_doors = { 1, 2, 3, 4, 5, 6 };
	local door_id = e.door:GetDoorID();

	if ( door_id >= 8 and door_id <= 13 ) then 
		e.self:MovePC(201, 456, 825, 9, 180);
	elseif ( door_id >= 1 and door_id <= 6 ) then
		if ( e.self:GetItemIDAt(30) == 31599 ) then 
 			MoveGroup(e.self:GetGroup(), e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 65, 1308, 7, 121);
		else
 			e.self:MovePC(201, 156, 470, -48, 180);
		end
	end
end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
   if ( trial_group ~= nil) then
      local trial_count = trial_group:GroupCount();

      for i = 0, trial_count - 1, 1 do
         local client_v = trial_group:GetMember(i):CastToClient();

         if (client_v.valid) then
            -- check the distance and port them up if close enough
            if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
               -- port the player up
               client_v:MovePC(201, tgt_x, tgt_y, tgt_z, tgt_h);
            end
         end
      end
   end
end

