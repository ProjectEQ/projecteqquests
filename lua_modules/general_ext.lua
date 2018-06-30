function eq.ChooseRandom(...)
	local tbl = {...};
	return tbl[math.random(#tbl)];
end

function eq.SelfCast(spell_id)
	local init = eq.get_initiator();
	local sp = Spell(spell_id);
	
	if(init.null or sp.null) then
		return;
	end
	
	init:SpellFinished(spell_id, init, 10, 0, -1, sp:ResistDiff());
end

function eq.ClassType(class)
	if(class == 8 or class == 15 or class == 3 or class == 4 or class == 5) then
		return "hybrid";
	elseif(class == 1 or class == 7 or class == 16 or class == 9) then
		return "melee";
	elseif(class == 11 or class == 12 or class == 13 or class == 14) then
		return "caster"
	elseif(class == 2 or class == 10 or class == 6) then
		return "priest";
	end
	
	return "other";
end

function eq.ZoneMarquee(color,opacity,fade_in,fade_out,duration,message)
--type = color, priority = text opacity, fade_in = 1, fade_out = fade out in MS, duration = duration in MS
--SendMarqueeMessage(Integer type, Integer priority, Integer fade_in, Integer fade_out, Integer duration, String msg);
--e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "
	local now_clients = eq.get_entity_list():GetClientList();
	for client in now_clients.entries do
		if (client.valid) then
			client:SendMarqueeMessage(color,opacity,fade_in,fade_out,duration,message);
		end
	end
end