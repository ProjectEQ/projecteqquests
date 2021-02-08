function event_spawn(e)
eq.set_timer('depop', 3600 * 1000);
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-315,-163,-402,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-284,50,-408,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-227,36,-400,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-143,76,-403,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-50,80,-400,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,38,78,-402,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,112,27,-394,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,163,-21,-407,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,208,-80,-406,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,230,-155,-406,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,228,-234,-402,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,209,-311,-407,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,153,-373,-399,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,100,-411,-404,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,50,-428,-406,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-9,-451,-406,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-85,-465,-407,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-153,-436,-399,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-222,-390,-404,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-256,-320,-406,0); -- NPC(s): #a_tempest_toad (210246)
eq.spawn2(eq.ChooseRandom(210246,210260), 0, 0,-316,-220,-404,0); -- NPC(s): #a_tempest_toad (210246)
end

function event_combat(e)
	if (e.joined == true) then
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	eq.set_timer('adds', 120 * 1000);
	else
		eq.resume_timer('depop');
		eq.stop_timer('adds');
	end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop();
elseif (e.timer == 'adds') then
eq.spawn2(eq.ChooseRandom(210261,210262), 0, 0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
eq.spawn2(eq.ChooseRandom(210261,210262), 0, 0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
eq.spawn2(eq.ChooseRandom(210261,210262), 0, 0,e.self:GetX(),e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading());
eq.spawn2(eq.ChooseRandom(210261,210262), 0, 0,e.self:GetX(),e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
end
end
