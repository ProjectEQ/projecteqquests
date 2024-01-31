function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 10, xloc + 10, yloc - 10, yloc + 10);
end

local portals = {
	[10092] = {"The Plane of Hate"},
	[10094] = {"The Plane of Sky"},
	[64191] = {"Dragonscale Hills"},
	[76000] = {"The Northern Plains of Karana"},
	[76001] = {"East Commonlands"},
	[76002] = {"The Lavastorm Mountains"},
	[76003] = {"Toxxulia Forest"},
	[76004] = {"The Greater Faydark"},
	[76005] = {"The Dreadlands"},
	[76006] = {"The Iceclad Ocean"},
	[76007] = {"Cobalt Scar"},
	[76009] = {"The Twilight Sea"},
	[76010] = {"Stonebrunt Mountains"},
	[76011] = {"Wall of Slaughter"},
	[76012] = {"Barindu, Hanging Gardens"},
	[76070] = {"The Undershore"},
	[88735] = {"Arcstone, Isle of Spirits"},
	[88736] = {"Goru`kar Mesa"},
	[88737] = {"your guild banner"},
	[88738] = {"Katta Castrum"},
	[88739] = {"The Plane of Time"},
	[88740] = {"Brell`s Rest"}
};

function event_enter(e)
	local guild_portal = ("guild_portal-"..e.other:GuildID());
	local portal_zone_item = tonumber(eq.get_data(guild_portal)) or 0;

	if portal_zone_item > 0 and portals[portal_zone_item] ~= nil then
		eq.popup("Teleport", "Teleport to ".. portals[portal_zone_item][1], portal_zone_item,1,0);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
