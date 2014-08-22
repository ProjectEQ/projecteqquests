-- qvic\player.lua

function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals["god_qvic_access"] ~= nil and qglobals["god_qvic_access"] == 1 and e.self:HasZoneFlag(295)) then
		eq.set_global("god_qvic_access","2",5,"F");
	end
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	--Txevu
	if (door_id == 2) then
		if(e.self:HasItem(60254)) then
			if(e.self:HasZoneFlag(297) == false) then
				e.self:SetZoneFlag(297);
			end
		end
		--allow a GM to pull in a raid to test
		local raid = e.self:GetRaid();
		local player_list = raid;
		if (e.self:Admin() > 80 and e.self:GetGM() and raid.valid and player_list ~= nil) then
			player_list_count = raid:RaidCount();
			for i = 0, player_list_count - 1, 1 do
				local client_v = player_list:GetMember(i):CastToClient();
				if (client_v.valid) then
					client_v:MovePC(297, -327, 0, -418, 65);
				end
			end
		end
	--Inktu`Ta
	elseif (door_id == 3) then
		local instance_id = eq.get_instance_id("inktuta",0);
		if (instance_id > 0) then
			e.self:MovePCInstance(296, instance_id, 0, 65, -1);
		else
			e.self:Message(13, "You are not a part of an instance!");
		end
	end
end