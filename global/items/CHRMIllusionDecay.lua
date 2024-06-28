-- CHRMIllusionDecay
-- Item will decay every minute by 2%
-- 10 ticks = 1 minute
-- 100 ticks = 10 minutes (Max Depeleted)

local time_since_last_change	= 0; -- Reversed counting - Starts at 100 and counts down to 0 (Cant be < 0 to prevent NAN errors)
local last_race					= 0;

function event_scale_calc(e)
	local base_race				= e.owner:GetBaseRace();
	local incoming_race_check	= e.owner:GetRace();

	if base_race ~= incoming_race_check then
		if time_since_last_change >= 1 then -- Do not go below 0 to prevent NAN errors
			time_since_last_change = time_since_last_change - 1;
		end

		if last_race ~= incoming_race_check then -- Reset Time as race has changed
			time_since_last_change = 100;
		end

		last_race = incoming_race_check;
	else -- can't get stats on base race.
		last_race = base_race;
		time_since_last_change = 0;
	end

	if time_since_last_change <= 0 then -- Safety Check to prevent NAN
		e.self:SetScale(0);
	else
		e.self:SetScale(time_since_last_change / 100);
	end
end
