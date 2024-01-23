function event_enter_zone(e)
	eq.set_timer("zone_in", 3 * 1000);
end

local portals = {
	[10092] = {"The Plane of Hate",186,-393,656,3},
	[10094] = {"The Plane of Sky",71,539,1384,-664},
	[64191] = {"Dragonscale Hills",442,-1954,3916,19},
	[76000] = {"The Northern Plains of Karana",13,1209,-3685,-5},
	[76001] = {"East Commonlands",22,-140,-1520,3},
	[76002] = {"The Lavastorm Mountains",27,460,460,-86},
	[76003] = {"Toxxulia Forest",38,-916,-1510,-33},
	[76004] = {"The Greater Faydark",54,-441,-2023,4},
	[76005] = {"The Dreadlands",86,9658,3047,1052},
	[76006] = {"The Iceclad Ocean",110,385,5321,-17},
	[76007] = {"Cobalt Scar",117,-1634,-1065,299},
	[76009] = {"The Twilight Sea",170,-1028,1338,39},
	[76010] = {"Stonebrunt Mountains",100,673,-4531,0},
	[76011] = {"Wall of Slaughter",300,-943,13,130},
	[76012] = {"Barindu, Hanging Gardens",283,209,-515,-119},
	[76070] = {"The Undershore",362,-750,-1002,48},
	[88735] = {"Arcstone, Isle of Spirits",369,1630,-279,5},
	[88736] = {"Goru`kar Mesa",397,-85,-2050,19},
	[88737] = {"your guild banner",1,1,1,1}, -- Not Implemented
	[88738] = {"Katta Castrum",416,-2,-425,-19},
	[88739] = {"The Plane of Time",219,0,110,8},
	[88740] = {"Brell`s Rest",480,-23,-619,36}
};

function event_timer(e)
	eq.stop_timer(e.timer);
	local guild_portal = ("guild_portal-"..e.self:GuildID());
	local portal_zone_item = tonumber(eq.get_data(guild_portal)) or 0;

	if portal_zone_item > 0 and portals[portal_zone_item] ~= nil then
		e.self:Message(MT.Tell, "Zeflmin Welikanin says, The teleport stone is currently aligned to ".. portals[portal_zone_item][1]);
	end
end

function event_popup_response(e)
	if portals[e.popup_id] ~= nil then
		e.self:MovePC(portals[e.popup_id][2], portals[e.popup_id][3], portals[e.popup_id][4], portals[e.popup_id][5],0);
	end
end
