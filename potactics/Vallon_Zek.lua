function event_spawn(e)
	eq.set_timer("vzspawned",1000);
	--one second delay so everything processes
end

function event_timer(e)
	if (e.timer == "vzspawned") then
		--tell vallon_controller I spawned
		eq.stop_timer("vzspawned");
		eq.signal(214112,1); -- NPC: #vallon_controller
	end
end

function event_signal(e)
	--signal value equals which phase we are on
	if (e.signal == 1) then
		--phase 1, depop at 75%
		eq.set_next_hp_event(76);
	elseif (e.signal == 2 or e.signal == 3) then
		--phase 2 and 3 depop at 50%
		eq.set_next_hp_event(51);
	end
end

function event_hp(e)
	--tell vallon_controller I have depopped
	eq.signal(214112,2); -- NPC: #vallon_controller
	eq.depop();
end

function event_death_complete(e)
	--spawn planar projection
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.spawn2(202368,0,0,xloc,yloc,zloc,0); -- NPC: A_Planar_Projection
	--tell vallon_controller I died
	eq.signal(214112,3); -- NPC: #vallon_controller
end