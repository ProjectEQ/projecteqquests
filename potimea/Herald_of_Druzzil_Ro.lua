-- Herald_of_Druzzil_Ro (219055)

function event_say (e)
	if(e.message:findi("hail")) then
    e.self:Say("I am sorry if we have met and I do not remember you.  I have become more and more fractured.  I barely retain my powers, though others of me may still remain with strength.  The only service I can perform for you now would be transportation to the Plane of Knowledge.  If you would like, I can [" .. eq.say_link("send",false,"send").."] you there.  Even now things start to come apart.  An anomaly, a tear.  Things become distorted.  I become we.  I can see what was.  I can reach into it.  I can touch the past.");
	elseif (e.message:findi("send")) then
    --Plane of Knowledge 
    e.other:MovePC(202, 232.92, -248.8, -125.0, 165.0);
	end
end
