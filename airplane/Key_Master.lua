local counter;

function event_spawn(e)
	counter = 0;
end

function event_signal(e)
	local qglobals = eq.get_qglobals();

	if(e.signal == 1) then -- azarack
		counter = counter + 1;
		if(counter == 10) then
			eq.spawn2(71059,0,0,-602.2,-254.4,-333.5,403); -- NPC: Protector_of_Sky
			counter = 0;
		end
	elseif(e.signal == 2 and qglobals["keeper"] == nil) then
		-- eq.set_timer("13",300000); what is this referred to?
		eq.set_global("keeper","1",3,"H2");
		-- supposed to be 60-85 minute timer
		eq.set_timer("87",math.random(1500000) + 3600000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, brave traveller. I sell keys that take you to other islands in this here Plane of Sky. My prices are the best around. Heh, heh.");
	end
end

function event_timer(e)
	if(e.timer == "87") then
		eq.spawn2(71075,0,0,-996.3,910.5,192.3,36); -- NPC: Keeper_of_Souls
		eq.stop_timer("87");
	end
end

-- END of FILE Zone:airplane  ID:2977 -- Key_Master
