function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s!  I am Tubal Weaver. humble merchant and retired guardsman of Highkeep.  I make a tidy living dealing with the throngs of adventurers who take it upon themselves to keep Qeynos beetle-free.  If you want some free advice. I recommend that you not deal with any of the merchants in town.  I can offer much lower prices than they because I do not have the overhead of a shop to maintain.",e.other:GetName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Whew. I am parched. I will be back in a few minutes.");
	elseif(e.wp == 15) then
		e.self:Say("Hey sweetheart, I'll have my usual. Could you bring it upstairs for me?");
		eq.signal(2083,1); -- NPC: Sabnie_Blagard General Supplies
	elseif(e.wp == 38) then
		e.self:Say("Hey, hey, hey! Tubal Weaver open for business!");
	end
end

function event_signal(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	
	if(e.signal == 1 and xloc == 372 and yloc == 37) then
		e.self:Say("Is he wise to us?");
		eq.signal(2083,3); -- NPC: Sabnie_Blagard General Supplies
	elseif(e.signal == 2) then
		e.self:Say("Well, we won't have to worry about him much longer. I have some friends coming into town who owe me the kind of debt you can't repay with gold.");
		eq.signal(2083,4); -- NPC: Sabnie_Blagard General Supplies
	elseif(e.signal == 3) then
		e.self:Say("Don't you worry, sugar, his days are numbered. You better get back before he suspects something. We'll be together soon enough.");
	end
end
