function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you. Your city of stone walls is quite magnificent. Still, the glory of Surefall Glade puts this city to shame.");
	elseif(e.message:findi("assassin")) then
		e.self:Say("What!!?  Must be an Unkempt Druid Assassin nearby!!  Find him and slay him.  I am sure he stands to make a FORTUNE!  I believe the assassin may be carrying some sort of [black wood chip].");
		eq.spawn2(1179,0,0,-100,222,3,256); -- NPC: Raffel_Minnmorn
	elseif(e.message:findi("black wood chip")) then
		e.self:Say("That is the mark of an Unkempt Druid.  Long ago there was a tree in Norrath we called the Great Tunarbos.  Legend says it spawned all the woodlands of Norrath.  Many centuries ago, long before the Combine Era, the Great Tunarbos was burned to the ground by unknown means.  The ancient rangers kept what little of the great tree they could find.  To make it short, all Unkempt Druids now carry burned wood chips to represent the great tree.  They are not real.  Take any black wood chips to Gerael Woodone in Surefall Glade.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Say("Even the beauty of the ocean pales in comparison to the towering pines of Surefall Glade.");
	elseif(e.wp == 27) then
		e.self:Say("I have had a tree sap from Surefall Glade which tastes better than this ale.");
	end
end
