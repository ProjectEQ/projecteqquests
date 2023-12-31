local box = require("aa_box");

local room1_clear = false;
local room2_clear = false;
local room3_clear = false;
local room4_clear = false;
local room5_clear = false;

-- Top = North (Y+), Bottom = South (Y-), Right = East (X-), Left = West (X+)

local room1 = {left = 1025, top = -720, right = 830, bottom = -950} -- North Room
local room1_box = box(room1.top, room1.bottom, room1.right, room1.left)

local room2 = {left = 1414, top = -1030, right = 1228, bottom = -1258} -- West Room
local room2_box = box(room2.top, room2.bottom, room2.right, room2.left)

local room3 = {left = 1211, top = -952, right = 1014, bottom = -1141} -- Center Room
local room3_box = box(room3.top, room3.bottom, room3.right, room3.left)

local room4 = {left = 947, top = -1210, right = 753, bottom = -1437} -- South Room
local room4_box = box(room4.top, room4.bottom, room4.right, room4.left)

local room5 = {left = 766, top = -933, right = 544, bottom = -1125} -- East Room
local room5_box = box(room5.top, room5.bottom, room5.right, room5.left)

function event_spawn(e)
	local instance_id = eq.get_zone_instance_version();
	if instance_id == 2 then
		eq.set_timer("raid_room_check", 3 * 1000); -- 3 second room checks
	end
end

function event_timer(e)
	if e.timer == "raid_room_check" then -- Raid room checks
		local npc_list = eq.get_entity_list():GetNPCList();
		local room1_count = 0;
		local room2_count = 0;
		local room3_count = 0;
		local room4_count = 0;
		local room5_count = 0;

		for npc in npc_list.entries do
			if npc.valid then
				if not room1_clear and room1_box:contains(npc:GetSpawnPointX(), npc:GetSpawnPointY()) and npc:GetRace() == 361 then -- North Room
					room1_count = room1_count + 1;
				elseif not room2_clear and room2_box:contains(npc:GetSpawnPointX(), npc:GetSpawnPointY()) and npc:GetRace() == 361 then -- West Room
					room2_count = room2_count + 1;
				elseif not room3_clear and room3_box:contains(npc:GetSpawnPointX(), npc:GetSpawnPointY()) and npc:GetRace() == 361 then -- Center Room
					room3_count = room3_count + 1;
				elseif not room4_clear and room4_box:contains(npc:GetSpawnPointX(), npc:GetSpawnPointY()) and npc:GetRace() == 361 then -- South Room
					room4_count = room4_count + 1;
				elseif not room5_clear and room5_box:contains(npc:GetSpawnPointX(), npc:GetSpawnPointY()) and npc:GetRace() == 361 then -- East Room
					room5_count = room5_count + 1;
				end
			end
		end

		if not room1_clear and room1_count == 1 then
			eq.signal(259159, 1); -- Room 1 Clear
			room1_clear = true;
		end

		if not room2_clear and room2_count == 1 then
			eq.signal(259159, 2); -- Room 2 Clear
			room2_clear = true;
		end

		if not room3_clear and room3_count == 1 then
			eq.signal(259159, 3); -- Room 3 Clear
			room3_clear = true;
		end

		if not room4_clear and room4_count == 0 then
			eq.signal(245275,1); -- NPC: #Leannra_Nuadr
			room4_clear = true;
		end

		if not room5_clear and room5_count == 0 then
			eq.signal(245264,1); -- NPC: #Gaddian_Opaleye
			room5_clear = true;
		end

		if room1_clear and room2_clear and room3_clear and room4_clear and room5_clear then
			eq.zone_emote(MT.Yellow, "A great roar shakes the cavern walls.  Small pieces of debris fall from the walls and tumble to the ground at your feet.  The warden's voice snarls at you, 'You'll not leave this place alive softskins!  I'll be feeding your miserable carcasses to the prison dogs in the morning!");
			eq.spawn2(245296, 0, 0, 898, -1075, -18, 382);  --warden
			eq.spawn2(245284, 0, 0, 917, -1094, -20, 315);  --shaman
			eq.depop();
		end
	end
end
