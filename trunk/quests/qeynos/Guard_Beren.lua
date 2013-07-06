function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want? Are you friends with that lousy [dwarf]?! You had better not be unless you want to spend the rest of the week bleeding!");
	elseif(e.message:findi("dwarf")) then
		e.self:Say("That dwarf, Trumpy, who Corshin here thinks is a friend of Commander Bayle's, keeps pestering my poor brother Faren. I have had just about enough of him and [his kind].");
	elseif(e.message:findi("his kind")) then
		e.self:Say("You know... thieves, drunks and murderers. Decent folk just don't have a chance anymore.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("How are they biting, little brother?");
		eq.signal(1159,1);
	end
end

function event_signal(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	if(e.signal == 1 and xloc == -145 and yloc == -247) then
		e.self:Say("Yes, sir!");
	elseif(e.signal == 2) then
		e.self:Say("Don't you worry about him! I will take care of [Trumpy] Irontoe once and for all!");
	elseif(e.signal == 3 and xloc == -145 and yloc == -247) then
		e.self:Say("Curse you, [Trumpy]!!!");
		eq.signal(1091,2);
	elseif(e.signal == 4 and xloc == -145 and yloc == -247) then
		e.self:Say("If you ever talk that way about my [brother] again, I will throw your butt into the dungeon. I don't care who you know!");
		eq.signal(1042,3);
	elseif(e.signal == 5 and xloc == -145 and yloc == -247) then
		e.self:Say("Heh, Speak for yourself, Corshin. That one looks like a troublemaker to me.");
	end
end
