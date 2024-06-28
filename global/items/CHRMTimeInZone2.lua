-- CHRMTimeInZone2

local time_in_zone = {};

function event_item_enter_zone(e)
	local playerId = e.owner:GetID();
	time_in_zone[playerId] = {1}; -- Start with 1 minutes to avoid divide by 0 (NAN)
end

function event_scale_calc(e)
	local playerId = e.owner:GetID();
	local player_time = 1; -- 1 to prevent NAN

	if time_in_zone[playerId] ~= nil then
			player_time = tonumber(time_in_zone[playerId][1]);

			if player_time == nil then
				-- nil
			elseif player_time< 1200 then -- 2 Hours
					time_in_zone[playerId][1] = player_time + 1;
			end

			e.self:SetScale(tonumber(time_in_zone[playerId][1])/1200);
	else
			time_in_zone[playerId] = {1}; -- Start with 1 minutes to avoid divide by 0 (NAN)
	end
end
