function event_waypoint_arrive(e)
	if e.wp == 2 then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(68235) then
			e.self:Say("WARNING TO ALL TRAVELERS! Bandits have been sighted on the road ahead. Beware!");
			eq.unique_spawn(68235,13,0,-510,1094,8,0);
		end
		eq.set_timer("warning", 36 * 1000);
	end
end

function event_waypoint_depart(e)
	if e.wp == 2 then
		eq.stop_timer("warning");
	end
end

function event_timer(e)
	if e.timer == "warning" then
		e.self:Say("WARNING TO ALL TRAVELERS! Bandits have been sighted on the road ahead. Beware!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 18905}) then
		e.self:Say("Eh, strapling? Ye got this from me ol' partner? Huh. Aye, I know what it means but ye're not hearin'. Here, take this. It was his but he's not needin' it now.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5037,5029,13313),30000); -- Bronze Two Handed Battle Axe or Bronze Bastard Sword or Dwarven Axe
	end
end