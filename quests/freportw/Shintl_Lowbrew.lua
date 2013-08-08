function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. mighty one! What are you doing in the city?  You should be out slaying beasts. There is nothing to find here in the city.");
	elseif(e.message:findi("hollish")) then
		e.self:Say("I have never heard of this Hollish character you speak of. You must be confusing me for someone else.");
	elseif(e.message:findi("opal")) then
		e.self:Say("Opal is just a friend I have here in Freeport. She works at the Academy of Arcane Science.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		eq.create_ground_object(12147,-448,-107,-10.870,0,90000);
	elseif(e.wp == 7) then
		e.self:Say("Any mail for room number two?");
		eq.signal(9103, 1);
	end
end
