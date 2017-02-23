function event_say(e)
local zone_time = eq.get_zone_time();

 if(e.language == 14 and e.other:GetLanguageSkill(14) >= 100 and zone_time["zone_hour"]==19 and e.other:FindBuff(5574)) then
	if (e.message:findi("start the contest")) then
		e.self:Shout("You right! Me want prize! Start contest! King Dronan owe us contest!");
		eq.unique_spawn(92198, 0, 0, 2436, 3546, 320, 94);  --Goblin King Dronan
		eq.unique_spawn(92199, 0, 0, 2404, 3541, 322, 103); --Whip Cracker Garzul
		eq.unique_spawn(92200, 0, 0, 2470, 3551, 313, 88);  --Earth Seer Hunknort
	end	
 end
 
 if (e.message:findi("testquestfile")) then
	e.self:Say("lang:" .. e.language)
	e.self:Say("skill:" .. e.other:GetLanguageSkill(14))
	e.self:Say("zh: " .. zone_time["zone_hour"]);
	if (e.other:FindBuff(5574)) then
		e.self:Say("hasbuff")
	end
 end
end
