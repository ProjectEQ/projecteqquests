local x_max = 420;
local x_min = 225;
local y_max = -385;
local y_min = -605;

local z_const = -2;

local x_spawn = 0;
local y_spawn = 0;

function event_spawn(e)
	x_spawn = e.self:GetX();
	y_spawn = e.self:GetY();
	e.self:SetDisableMelee(true)
end

function event_combat(e)
	if e.joined then
		eq.set_timer("shadowstep", 40 * 1000); -- 40s Shadowstep
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 30 * 1000); -- 30s Reset
		eq.stop_timer("shadowstep");
	end
end

function event_timer(e)
	if e.timer == "shadowstep" then
		local new_x = math.random(x_min, x_max);
		local new_y = math.random(y_min, y_max);
		e.self:Emote("Usher of Kelekdrix blinks out of existence and appears elsewhere.");
		e.self:GMMove(new_x,new_y,z_const,2);
	elseif e.timer == "reset" then
		eq.stop_timer("reset");
		e.self:GMMove(x_spawn,y_spawn,z_const,2);
	end
end
