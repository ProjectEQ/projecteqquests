function event_say(e)
	--if(e.language == 14 and e.self:GetLanguageSkill(14) >= 100 and zone_time["zone_hour"]==19 and e.other:FindBuff(5574))
	local qglobals = eq.get_qglobals(e.other);
	local zone_time = eq.get_zone_time();
	if (e.message:findi("start the contest")) then
		--e.other:Message(1,"Got prox say");
		--e.other:Message(2,"time:" .. zone_time["zone_hour"]);
		e.self:Shout("You right! Me want prize! Start contest! King Dronan owe us contest!");
		eq.unique_spawn(92198, 0, 0, 2436, 3546, 320, 94);  --Goblin King Dronan
		eq.unique_spawn(92199, 0, 0, 2404, 3541, 322, 103); --Whip Cracker Garzul
		eq.unique_spawn(92200, 0, 0, 2470, 3551, 313, 88);  --Earth Seer Hunknort
	end
	--end
end

--spawn seekers at 2878,3351,345.5,0
-- path to 2882 3509.6 358  ~15 seconds

--path half to 3324 3350 350 94
--path half to 2108 3532 309 196

--[Thu Feb 16 11:16:28 2017] a goblin whipcracker shouts, in Goblin, 'You right! Me want prize! Start contest! King Dronan owe us contest!'
--[Thu Feb 16 11:25:02 2017] Goblin King Dronan shouts, in Goblin, 'Contest start now!'

-- set total timer at 30 min