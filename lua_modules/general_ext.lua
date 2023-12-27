function eq.ChooseRandom(...)
	local tbl = {...};
	return tbl[math.random(#tbl)];
end

function eq.SelfCast(spell_id)
	local init = eq.get_initiator();
	local sp = Spell(spell_id);

	if(init.null or sp.null) then
		return;
	end

	init:SpellFinished(spell_id, init, 10, 0, -1, sp:ResistDiff());
end

function eq.ClassType(class)
	if(class == 8 or class == 15 or class == 3 or class == 4 or class == 5) then
		return "hybrid";
	elseif(class == 1 or class == 7 or class == 16 or class == 9) then
		return "melee";
	elseif(class == 11 or class == 12 or class == 13 or class == 14) then
		return "caster"
	elseif(class == 2 or class == 10 or class == 6) then
		return "priest";
	end

	return "other";
end

function eq.ZoneMarquee(color,opacity,fade_in,fade_out,duration,message)
--type = color, priority = text opacity, fade_in = 1, fade_out = fade out in MS, duration = duration in MS
--SendMarqueeMessage(Integer type, Integer priority, Integer fade_in, Integer fade_out, Integer duration, String msg);
--e.self:SendMarqueeMessage(MT.Yellow, 510, 1, 100, 10000, "
	local now_clients = eq.get_entity_list():GetClientList();
	for client in now_clients.entries do
		if (client.valid) then
			client:SendMarqueeMessage(color,opacity,fade_in,fade_out,duration,message);
		end
	end
end

-- This is a function to produce a local emote, using similar syntax to zone_emote from lua_general.
-- Expected data types - locs: table in { x, y, z } format, color: int, radius: int, message: string.
-- Does not return any values.
function eq.local_emote(locs, color, radius, message)

	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if(player:CalculateDistance(locs[1], locs[2], locs[3]) <= radius) then
				player:Message(color, message)
			end
		end
	end
end

--send a message only to GM toggled characters (useful for debugging/monitoring)
function eq.GM_Message(color,text)
	local client_list = eq.get_entity_list():GetClientList();

	if(client_list ~= nil) then
		for client in client_list.entries do
			if client:GetGM() then
				client:Message(color,text);
			end
		end
	end
end

--check for players within a specified unit range
function eq.PlayerCheck(x,y,z,dist)
	local client_list = eq.get_entity_list():GetClientList();

	if (client_list ~= nil) then
		for client in client_list.entries do
			if client:CalculateDistance(x,y,z) <= dist then
				return true; --client in range
			end
		end
	end
	return false;
end

function eq.ExpHelper(level, percent, range)
	-- helper function to come up with appropriate XP rewards for quests
	-- level -> level range to use from table
	-- percent -> percent of exp at the level to give (default = 3)
	-- range -> range of randomness (default = 1)
	-- example: ExpHelper(51, 5, 1) will return a random exp value between 4% and 6% (5% average, range of 1%) of experience required to level from 51 to 52

	-- defaults
	percent = percent or 3;
	range = range or 1;

	-- hardcoded exp by level table, note this is exp to go from level n to level n+1, not total exp at level
	local exp = {
		[1] = 1000,
		[2] = 7000,
		[3] = 19000,
		[4] = 37000,
		[5] = 61000,
		[6] = 91000,
		[7] = 127000,
		[8] = 169000,
		[9] = 217000,
		[10] = 271000,
		[11] = 331000,
		[12] = 397000,
		[13] = 469000,
		[14] = 547000,
		[15] = 631000,
		[16] = 721000,
		[17] = 817000,
		[18] = 919000,
		[19] = 1027000,
		[20] = 1141000,
		[21] = 1261000,
		[22] = 1387000,
		[23] = 1519000,
		[24] = 1657000,
		[25] = 1801000,
		[26] = 1951000,
		[27] = 2107000,
		[28] = 2269000,
		[29] = 2437000,
		[30] = 5311000,
		[31] = 3070100,
		[32] = 3274700,
		[33] = 3485900,
		[34] = 3703700,
		[35] = 8215600,
		[36] = 4537200,
		[37] = 4796400,
		[38] = 5062800,
		[39] = 5336400,
		[40] = 12017200,
		[41] = 6397296,
		[42] = 6717104,
		[43] = 7044704,
		[44] = 7380096,
		[45] = 16835800,
		[46] = 8695400,
		[47] = 9081792,
		[48] = 9476608,
		[49] = 9879808,
		[50] = 10291392,
		[51] = 23976496, -- this is the amount of exp for an AA!
		[52] = 25996304,
		[53] = 28118096,
		[54] = 46090704,
		[55] = 50205888,
		[56] = 54529312,
		[57] = 59065696,
		[58] = 63819904,
		[59] = 89334624,
		[60] = 53462976,
		[61] = 34041088,
		[62] = 35175680,
		[63] = 36328960,
		[64] = 37500672,
		[65] = 38691072,
		[66] = 39900160,
		[67] = 41127680,
		[68] = 42373888,
		[69] = 43638720,
		[70] = 44922048,
		[71] = 46224128,
		[72] = 47544704,
		[73] = 48883840,
		[74] = 50241792,
		[75] = 51618048,
		[76] = 53013120,
		[77] = 54426752,
		[78] = 55858816,
		[79] = 57309696,
		[80] = 58779136,
		[81] = 60267136,
		[82] = 61773696,
		[83] = 63298816,
		[84] = 64842752,
		[85] = 66405120,
		[86] = 67986048,
		[87] = 69585792,
		[88] = 71203840,
		[89] = 72840704,
		[90] = 74496000,
		[91] = 76170240,
		[92] = 77862656,
		[93] = 79574016,
		[94] = 81303552,
		[95] = 83052032,
		[96] = 84819200,
		[97] = 86604800,
		[98] = 88408832,
		[99] = 90231552,
		[100] = 92073216
	}

	-- return random between upper bound and lower bound
	return (math.random(exp[level] * (percent - range), exp[level] * (percent + range)) * .01)

end

-- https://stackoverflow.com/questions/656199/search-for-an-item-in-a-lua-list
function eq.Set (list)
	local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
end

function eq.seconds(duration_str)
	local w = duration_str:match("(%d+)w") or 0
	local d = duration_str:match("(%d+)d") or 0
	local h = duration_str:match("(%d+)h") or 0
	local m = duration_str:match("(%d+)m") or 0
	local s = duration_str:match("(%d+)s") or 0
	return s + (m * 60) + (h * 3600) + (d * 86400) + (w * 604800)
end

-- random amount of cash in copper, returns totals of copper, silver, gold, platinum
function eq.RandomCash(min, max)
	local total = Random.Int(min, max)
	local platinum = math.modf(total / 1000)
	total = total - platinum * 1000
	local gold = math.modf(total / 100)
	total = total - gold * 100
	local silver = math.modf(total / 10)
	total = total - silver * 10
	return total, silver, gold, platinum
end

-- os.getenv fixes the http luarocks proxy check by returning nil
function os.getenv(o)
    return nil
end

function eq.split(s, delimiter)
  result = {};

  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end

  return result;
end

