local text_trigger = 0;
local twins = 0;

function event_spawn(e)
	local x,y = e.self:GetX(), e.self:GetY();
	eq.set_proximity(x - 80, x + 80, y - 80, y + 80);
end

function event_enter(e)
	if text_trigger == 0 then
		eq.zone_emote(MT.Yellow,"As your eyes adjust to the shadows, a dark aura surrounds your body and invades your mind. The taint of Trushar permeates the halls of this temple and its touch is maddening, affecting your ability to concentrate, and wracking your body with pain as your muscles constrict involuntarily.");
		text_trigger = 1;
	end
end

function event_signal(e)
	local dz = eq.get_expedition()
	if e.signal == 1 then
		if twins == 0 then
			twins = twins + 1;
			if dz.valid then
				dz:AddReplayLockout(eq.seconds("22h"))
			end
		elseif twins == 1 then
			if dz.valid then
				dz:AddReplayLockout(eq.seconds("44h"))
			end
		end
	elseif e.signal == 2 then
		if dz.valid then
			dz:AddReplayLockout(eq.seconds("59h"))
		end
	elseif e.signal == 3 then
		if dz.valid then
			dz:AddReplayLockout(eq.seconds("107h"))
		end
	end
end
