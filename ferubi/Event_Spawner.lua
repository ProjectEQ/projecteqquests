local blademaster_counter = 0;
local spearmaster_counter = 0;
local hammermaster_counter = 0;
local brawler_counter = 0;

function event_spawn(e)
  blademaster_counter = 0;
  spearmaster_counter = 0;
  hammermaster_counter = 0;
  brawler_counter = 0;
end

function event_signal(e)
  if (e.signal == 1) then
    blademaster_counter = blademaster_counter + 1;
	eq.debug("blademaster spawn count: " ..  blademaster_counter);
	end
	if (blademaster_counter == 100) then
     	eq.unique_spawn(284039,0,0,443,428,102.5,0); -- Pxet_Elite_Blademaster (284039)
	blademaster_counter = 0;
	end
  if (e.signal == 2) then
    spearmaster_counter = spearmaster_counter + 1;
	end
	if (spearmaster_counter == 100) then
     	eq.unique_spawn(284091,0,0,-771,354,98,240); -- Pxet_Elite_Spearmaster (284091)
	spearmaster_counter = 0;
 	end
  if (e.signal == 3) then
    hammermaster_counter = hammermaster_counter + 1;
	end
	if (hammermaster_counter == 100) then
     	eq.unique_spawn(284090,0,0,570,-486,4,404); -- Pxet_Elite_Hammermaster (284090)
	hammermaster_counter = 0;
	end
  if (e.signal == 4) then
    brawler_counter = brawler_counter + 1;
	end
	if (brawler_counter == 100) then
     	eq.unique_spawn(284088,0,0,-723,-643,27,508); -- Pxet_Elite_Brawler (284088)
	brawler_counter = 0;
	end
end
