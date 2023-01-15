--#Shadow_of_Kazrok (223244)
--Phase 1 - Kazrok of Fire Trial
--potimeb

--add spawn boundary
local min_x = -50;
local max_x = 65;
local min_y = 540;
local max_y = 610;

function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,2);
end

function event_spawn(e)
	eq.set_next_hp_event(76);
end

function event_hp(e)
	if (e.hp_event == 76) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
		eq.set_next_hp_event(21);
	elseif (e.hp_event == 21) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,math.random(min_x,max_x),math.random(min_y,max_y),495,e.self:GetHeading());
	end
end

