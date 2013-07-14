function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s.  My name is Bren Treeclimber and I am a Protector of the Pine.  We have sworn our lives to protecting all the animals of Surefall Glade.  [Poachers], beware!",e.other:GetName()));
	elseif(e.message:findi("poacher")) then
		e.self:Say("Heh?  Oh.  Poachers are constantly after our bears for their valuable skins.  I wish those darn [Millers] would move on. Then, maybe, our bears would be left alone.  I have seen far too many of my friends die.  I will kill anyone I see harming my bears.");
	elseif(e.message:findi("millers")) then
		e.self:Say("The Millers?!  Those butchers!  We have caught that Baobob and his sister trying to poach more than once.  And to think we took them in and gave them shelter when they were in need.  All the while, they were just trying to get to our bears.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 130) then
		e.self:SetRunning(true);
	elseif(e.wp == 216 ) then
		e.self:SetRunning(false);
	elseif(e.wp == 258) then
		eq.set_anim(3027,1);
		e.self:Say("Hey there, big bear! Good bear! Keep clear of those mean ol' poachers.");
	elseif(e.wp == 259) then
		eq.set_anim(3027,0);
	end
end
