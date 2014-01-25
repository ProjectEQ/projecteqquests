-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

function event_spawn(e)
	eq.set_timer("1",1000);
end

function event_combat(e) -- ??
	if(e.joined == true) then
		eq.spawn2(154054,0,0,972.00,-556.00,-41.00,185); -- Defiled Minion
		eq.spawn2(154054,0,0,970.00,-602.00,-41.00,225); -- Defiled Minion
		eq.spawn2(154054,0,0,910.00,-602.00,-41.00,30); -- Defiled Minion
		eq.spawn2(154054,0,0,905.00,-556.00,-41.00,60); -- Defiled Minion
		eq.set_timer("2",120000);
	end
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();

		if(e.timer == "2") then
			eq.spawn2(154054,0,0,972.00,-556.00,-41.00,185); -- Defiled Minion
			eq.spawn2(154054,0,0,970.00,-602.00,-41.00,225); -- Defiled Minion
			eq.spawn2(154054,0,0,910.00,-602.00,-41.00,30); -- Defiled Minion
			eq.spawn2(154054,0,0,905.00,-556.00,-41.00,60); -- Defiled Minion
		end

		if(e.timer == "1" && yloc > -545) then
			e.self:Shout("You will never remove me from my chamber!");
			eq.depop();
			eq.spawn2(154145,0,0,940.00,-610.00,-41.00,0); -- Respawn Kahti Sha
			eq.signal(154054);
			eq.stop_timer("2");
		end

		if(e.timer == "3") then
			eq.stop_all_timers();
			eq.depop();
		end
end

function event_signal(e)
	e.self:Emote("Who dares break the seals and defile the inner sanctum? Come forth so that I may crush you!");
	e.self:Say("With the seals broken the grimlings come to help solidify the door, to make sure no one enters."); -- ??
	-- quest::me("With the seals broken the grimlings come to help solidify the door, to make sure no one enters.");
	eq.spawn2(154129,0,0,684.93,-380.15,-23.94,260);
	eq.spawn2(154129,0,0,684.93,-368.50,-23.94,260);
	eq.spawn2(154129,0,0,670.74,-358.34,-23.94,260);
	eq.spawn2(154129,0,0,670.74,-391.97,-23.94,260);
	eq.set_timer("3",7200000); -- 2 Hour kill timer
end

function event_death_complete(e)
	eq.stop_all_timers();
end
