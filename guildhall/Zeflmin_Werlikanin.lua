function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello ".. e.other:GetName() ..". Come to take a look at the crystal geode? The geode has some very strong magic inside of it that can help you. I can bring out the magic of the geode for you, but a gnome has to make a living! Even if he's stuck in this little hole in the wall all the time. Not that I'm bitter. Each of the crystals I sell is linked to a location in our world. If you give me one of the crystals I can focus the geode to let you and your companions travel there in the blink of an eye!");
	end
end

local portals = {
	[10092] = {"The Plane of Time"},
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

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 10092}) then -- Items: Portal Items
		set_portal(e,10092);
	elseif item_lib.check_turn_in(e.trade, {item1 = 10094}) then -- Items: Portal Items
		set_portal(e,10094);
	elseif item_lib.check_turn_in(e.trade, {item1 = 64191}) then -- Items: Portal Items
		set_portal(e,64191);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76000}) then -- Items: Portal Items
		set_portal(e,76000);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76001}) then -- Items: Portal Items
		set_portal(e,76001);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76002}) then -- Items: Portal Items
		set_portal(e,76002);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76003}) then -- Items: Portal Items
		set_portal(e,76003);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76004}) then -- Items: Portal Items
		set_portal(e,76004);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76005}) then -- Items: Portal Items
		set_portal(e,76005);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76006}) then -- Items: Portal Items
		set_portal(e,76006);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76007}) then -- Items: Portal Items
		set_portal(e,76007);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76008}) then -- Items: Portal Items
		set_portal(e,76008);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76009}) then -- Items: Portal Items
		set_portal(e,76009);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76010}) then -- Items: Portal Items
		set_portal(e,76010);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76011}) then -- Items: Portal Items
		set_portal(e,76011);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76012}) then -- Items: Portal Items
		set_portal(e,76012);
	elseif item_lib.check_turn_in(e.trade, {item1 = 76070}) then -- Items: Portal Items
		set_portal(e,76070);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88735}) then -- Items: Portal Items
		set_portal(e,88735);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88736}) then -- Items: Portal Items
		set_portal(e,88736);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88737}) then -- Items: Portal Items
		set_portal(e,88737);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88738}) then -- Items: Portal Items
		set_portal(e,88738);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88739}) then -- Items: Portal Items
		set_portal(e,88739);
	elseif item_lib.check_turn_in(e.trade, {item1 = 88740}) then -- Items: Portal Items
		set_portal(e,88740);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function set_portal(e,item)
	local guild_portal = ("guild_portal-"..e.other:GuildID());

	if portals[item] ~= nil then
		eq.set_data(guild_portal,tostring(item),tostring(eq.seconds("1d")));
		e.self:Emote("takes the crystal from you and mutters some arcane words over it. 'The crystal geode is now active, just go step on the crystal platform and you'll be whisked away to your destination! I hope you don't get motion sickness!'");
		eq.zone_emote(MT.Yellow,"The Guildhall Portal has been aligned to " .. portals[item][1]);
	end
end
