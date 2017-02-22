function event_say(e)
 if(e.language == 14 and e.self:GetLanguageSkill(14) >= 100 and zone_time["zone_hour"]==19 and e.other:FindBuff(5574))
	local qglobals = eq.get_qglobals(e.other);
	local zone_time = eq.get_zone_time();
	if (e.message:findi("start the contest")) then
		e.self:Shout("You right! Me want prize! Start contest! King Dronan owe us contest!");
		eq.unique_spawn(92198, 0, 0, 2436, 3546, 320, 94);  --Goblin King Dronan
		eq.unique_spawn(92199, 0, 0, 2404, 3541, 322, 103); --Whip Cracker Garzul
		eq.unique_spawn(92200, 0, 0, 2470, 3551, 313, 88);  --Earth Seer Hunknort
	end
 end
end
