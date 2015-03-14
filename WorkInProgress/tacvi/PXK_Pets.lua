-- PXK Pets (298222)
-- 
-- Spawn 298044 an ukun juxtapincer
-- Spawn 298043 an ukun lifebleeder
-- Spawn 298042 an ukun manasipper
-- Spanw 298041 an ukun ragehound
local juxtapincer = 0;
local lifebleeder = 0;
local manasipper  = 0;
local ragehound   = 0;

function event_spawn(e)

	eq.spawn2(298044,0,0, 151, -113, -6.87, 157);
	eq.spawn2(298043,0,0, 151, -218, -6.87, 225);
	eq.spawn2(298042,0,0,  81, -113, -6.87,  97);
	eq.spawn2(298041,0,0,  81, -218, -6.87,  20);

end

function event_signal(e)

	--eq.zone_emote(15, "Signal recieved: " .. e.signal);
	if (e.signal == 298044) then
		juxtapincer = juxtapincer + 1;
		--eq.zone_emote(15, "juxtapincer: " .. juxtapincer);
		if (juxtapincer < 3) then
			eq.spawn2(298044,0,0, 151, -113, -6.87, 157);
		end
	elseif (e.signal == 298043) then
		lifebleeder = lifebleeder + 1;
		--eq.zone_emote(15, "lifebleeder: " .. lifebleeder);
		if (lifebleeder < 3) then 
			eq.spawn2(298043,0,0, 151, -218, -6.87, 225);
		end
	elseif (e.signal == 298042) then
		manasipper = manasipper + 1;
		--eq.zone_emote(15, "manasipper: " .. manasipper);
		if (manasipper < 3) then
			eq.spawn2(298042,0,0,  81, -113, -6.87,  97);
		end
	elseif (e.signal == 298041) then
		ragehound = ragehound + 1;
		--eq.zone_emote(15, "ragehound: " .. ragehound);
		if (ragehound < 3) then
			eq.spawn2(298041,0,0,  81, -218, -6.87,  20);
		end
	end
	
	if (juxtapincer == 3 and lifebleeder == 3 and manasipper == 3 and ragehound == 3) then
		eq.depop();
	end
	
end
