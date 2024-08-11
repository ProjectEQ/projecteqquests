local blademaster_counter = 0;
local spearmaster_counter = 0;
local hammermaster_counter = 0;
local brawler_counter = 0;

function event_spawn(e)
	blademaster_counter		= tonumber(eq.get_data("ferubi-blademaster-count")) or 0;
	spearmaster_counter		= tonumber(eq.get_data("ferubi-spearmaster-count")) or 0;
	hammermaster_counter	= tonumber(eq.get_data("ferubi-hammermaster-count")) or 0;
	brawler_counter			= tonumber(eq.get_data("ferubi-brawler-count")) or 0;
end

function event_signal(e)
	if e.signal == 1 then
		blademaster_counter = blademaster_counter + 1;
		eq.set_data("ferubi-blademaster-count", tostring(blademaster_counter));
		-- eq.GM_Message(MT.LightBlue, "[DEBUG] blademaster spawn count = [".. blademaster_counter .."]");
		-- eq.debug("blademaster spawn count: " ..  blademaster_counter);
		
		if blademaster_counter == 100 then
			eq.unique_spawn(284039,0,0,443,428,102.5,0); -- Pxet_Elite_Blademaster (284039)
			eq.set_timer("resetblade", 3 * 1000); --3 sec reset
		end
	elseif e.signal == 2 then
		spearmaster_counter = spearmaster_counter + 1;
		eq.set_data("ferubi-spearmaster-count", tostring(spearmaster_counter));
		-- eq.GM_Message(MT.LightBlue, "[DEBUG] spearmaster spawn count = [".. spearmaster_counter .."]");
		-- eq.debug("spearmaster spawn count: " ..  spearmaster_counter);
		if spearmaster_counter == 100 then
			eq.unique_spawn(284091,0,0,-771,354,98,240); -- Pxet_Elite_Spearmaster (284091)
			eq.set_timer("resetspear", 3 * 1000); --3 sec reset
		end
	elseif e.signal == 3 then
		hammermaster_counter = hammermaster_counter + 1;
		eq.set_data("ferubi-hammermaster-count", tostring(hammermaster_counter));
		-- eq.GM_Message(MT.LightBlue, "[DEBUG] hammermaster spawn count = [".. hammermaster_counter .."]");
		-- eq.debug("hammermaster spawn count: " ..  hammermaster_counter);
		if hammermaster_counter == 100 then
			eq.unique_spawn(284090,0,0,570,-486,4,404); -- Pxet_Elite_Hammermaster (284090)
			eq.set_timer("resethammer", 3 * 1000); --3 sec reset
		end
	elseif e.signal == 4 then
		brawler_counter = brawler_counter + 1;
		eq.set_data("ferubi-brawler-count", tostring(brawler_counter));
		-- eq.GM_Message(MT.LightBlue, "[DEBUG] brawler spawn count = [".. brawler_counter .."]");
		-- eq.debug("brawler spawn count: " ..  brawler_counter);
		if brawler_counter == 100 then
			eq.unique_spawn(284088,0,0,-723,-643,27,508); -- Pxet_Elite_Brawler (284088)
			eq.set_timer("resetbrawler", 3 * 1000); --3 sec reset
		end
	end
end

function event_timer(e)
	if e.timer == "resetblade" then
		blademaster_counter = 0;
		eq.stop_timer("resetblade");
		eq.set_data("ferubi-blademaster-count", tostring(blademaster_counter));
	elseif e.timer == "resetspear" then
		spearmaster_counter = 0;
		eq.stop_timer("resetspear");
		eq.set_data("ferubi-spearmaster-count", tostring(spearmaster_counter));
	elseif e.timer == "resethammer" then
		hammermaster_counter = 0;
		eq.stop_timer("resethammer");
		eq.set_data("ferubi-hammermaster-count", tostring(hammermaster_counter));
	elseif e.timer == "resetbrawler" then
		brawler_counter = 0;
		eq.stop_timer("resetbrawler");
		eq.set_data("ferubi-brawler-count", tostring(brawler_counter));
	end
end
