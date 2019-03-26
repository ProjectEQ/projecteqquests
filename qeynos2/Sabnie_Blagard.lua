function event_say(e)

	if(e.message:findi("hail")) then
		e.self:Say("Greetings. thirsty traveler!  I recommend trying Crow's special brew.  It's the brew that put Qeynos on the map!");
	end

end

function event_waypoint_arrive(e)

	if(e.wp == 10) then
		e.self:Say("Did someone order an ale up here?");
		eq.signal(2062,1); -- NPC: Tubal_Weaver General Supplies
	elseif(e.wp == 18) then
		e.self:Say("Tubal doesn't suspect a thing.. the poor sap.");
		eq.signal(2063,3); -- NPC: Crow General Supplies
	end

end	

function event_signal(e)

	local xloc = e.self:GetX();
	local yloc = e.self:GetY();

	if(e.signal == 1 and xloc == 368 and yloc == 82) then
		e.self:Say("Um, sure. Be right.. um.. up.");
		eq.signal(2063,1); -- NPC: Crow General Supplies
	elseif(e.signal == 2) then
		e.self:Say("Yes. Fine. That guy just gives me the creeps is all.");
		eq.signal(2063,2); -- NPC: Crow General Supplies
	elseif(e.signal == 3) then
		e.self:Say("No. No. He is clueless. I've missed you so.");
		eq.signal(2062,2); -- NPC: Tubal_Weaver General Supplies
	elseif(e.signal == 4) then
		e.self:Say("Please be careful. I don't know what I would do if anything happened to you.");
		eq.signal(2062,3); -- NPC: Tubal_Weaver General Supplies
	elseif(e.signal == 5) then
		e.self:Say("No! um.. no. That's ok. He's just a little weird, that's all. Nothing to worry about.");
		eq.signal(2062,4); -- NPC: Tubal_Weaver General Supplies
	elseif(e.signal == 6) then
		e.self:Say("Hee hee hee! Oh.. how sad! HEE HEE HEE HEE HEE!");
	end

end
