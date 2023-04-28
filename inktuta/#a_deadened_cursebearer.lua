local new_speed			= 0.3;
local ramp_speed		= 0.1;
local current_target	= nil;

function event_spawn(e)
	current_target = nil;
	new_speed = 0.3;
	eq.set_timer("check_target", 2 * 1000);
	eq.set_timer("switch_target",10);
end

function event_timer(e)
	if e.timer == "check_target" then
		if not current_target.valid then
			eq.set_timer("switch_target",10);
		end
	elseif e.timer == "switch_target" then
		eq.stop_timer(e.timer);
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 15, 200, "The cursebearer advances with incredible speed. Nothing natural could possibly move that fast.");
		current_target = eq.get_entity_list():GetRandomClient(e.self:GetX(), e.self:GetY(), e.self:GetZ(),1000*1000);
		new_speed = 0.3;
		e.self:WipeHateList();
		if current_target ~= nil then
			current_target:Message(MT.Magenta, eq.ChooseRandom("The thoughts of a cursed trusik invade your mind, 'You will share my fate. Do not attempt to resist. I am coming for you.'","The thoughts of a cursed trusik invade your mind, 'You will not escape me so easily.'"))
			e.self:ModifyNPCStat("runspeed",tostring(new_speed));
			e.self:AddToHateList(current_target, 100000);
			eq.set_timer("switch_target", 60 * 1000);
			eq.set_timer("update_run_speed",10 * 1000) -- 10s increases reset on new target
		else
			eq.set_timer("switch_target",10);
		end
	elseif e.timer == "update_run_speed" then
		new_speed = new_speed + ramp_speed;
		e.self:ModifyNPCStat("runspeed",tostring(new_speed));
	end
end

function event_slay(e)
	e.self:Shout("Die!");
	eq.depop();
end
