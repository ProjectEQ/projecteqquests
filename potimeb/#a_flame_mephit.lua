--#a_flame_mephit (223088)
--Phase 1 - Kazrok of Fire Trial
--potimeb

--add spawn boundary
local min_x = -50;
local max_x = 65;
local min_y = 540;
local max_y = 610;

function event_death_complete(e)

	-- spawn 2x an_inferno_mephit
	eq.spawn2(eq.ChooseRandom(223095,223234,223235,223236,223237),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
	eq.spawn2(eq.ChooseRandom(223095,223234,223235,223236,223237),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
end
