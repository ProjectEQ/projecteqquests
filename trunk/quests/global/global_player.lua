function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.self:GetLevel() >= 15 and qglobals['Wayfarer'] == nil) then
		local zoneid = eq.get_zone_id();
		if(e.self:GetStartZone() ~= zoneid and (zoneid == 1 or zoneid == 2 or zoneid == 3 or zoneid == 8 or zoneid == 9 
		or zoneid == 10 or zoneid == 19 or zoneid == 22 or zoneid == 23 or zoneid == 24 or zoneid == 29 or zoneid == 30 
		or zoneid == 34 or zoneid == 35 or zoneid == 40 or zoneid == 41 or zoneid == 42 or zoneid == 45 or zoneid == 49 
		or zoneid == 52 or zoneid == 54 or zoneid == 55 or zoneid == 60 or zoneid == 61 or zoneid == 62 or zoneid == 67 
		or zoneid == 68 or zoneid == 75 or zoneid == 82 or zoneid == 106 or zoneid == 155 or zoneid == 202 or zoneid == 382 
		or zoneid == 383 or zoneid == 392 or zoneid == 393 or zoneid == 408)) then
			e.self:Message(15, 
				"A mysterious voice whispers to you, \'If you can feel me in your thoughts, know this -- "
				.. "something is changing in the world and I reckon you should be a part of it. I do not know much, but I do know "
				.. "that in every home city and the wilds there are agents of an organization called the Wayfarers Brotherhood. They "
				.. "are looking for recruits . . . If you can hear this message, you are one of the chosen. Rush to your home city, or "
				.. "search the West Karanas and Rathe Mountains for a contact if you have been exiled from your home for your deeds, "
				.. "and find out more. Adventure awaits you, my friend.\'");
		end
	end
end

function event_combine_success(e)
	if (e.recipe_id == 10904 or e.recipe_id == 10905 or e.recipe_id == 10906 or e.recipe_id == 10907) then
		e.self:Message(1,
		"The gem resonates with power as the shards placed within glow unlocking some of the stone's power. "
		.. "You were successful in assembling most of the stone but there are four slots left to fill, "
		.. "where could those four pieces be?"
		);
	elseif(e.recipe_id == 10903 or e.recipe_id == 10346 or e.recipe_id == 10334) then
		local reward = { };
		reward["melee"] =  { ["10903"] = 67665, ["10346"] = 67660, ["10334"] = 67653 };
		reward["hybrid"] = { ["10903"] = 67666, ["10346"] = 67661, ["10334"] = 67654 };
		reward["priest"] = { ["10903"] = 67667, ["10346"] = 67662, ["10334"] = 67655 };
		reward["caster"] = { ["10903"] = 67668, ["10346"] = 67663, ["10334"] = 67656 };

		local ctype = eq.ClassType(e.self:GetClass());
		e.self:SummonItem(reward[ctype][tostring(e.recipe_id)]);
		e.self:SummonItem(67704);
		e.self:Message(1, "Success");
	end
end

function event_command(e)
	return eq.DispatchCommands(e);
end
