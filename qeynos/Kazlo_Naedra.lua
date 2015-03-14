function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  I'm Kazlo Naedra of the Order of Three.  We always seem to be running out of [supplies] around here, which is, of course, very distracting to our studies.",e.other:GetName()));
	elseif(e.message:findi("blank scroll sheets")) then
		e.self:Say("These blank sheets seem harder to find every month. All the local merchants are out of them. Hopefully, one of the merchants out in Surefall will have some.");
	elseif(e.message:findi("supplies")) then
		if(fac < 5) then
			e.self:Say("Yes, we're almost out of [blank scroll sheets]. Gahlith will be very upset, unless I can replenish our inventory soon.");
		else
			e.self:Say("The Order of Three has been monitoring your recent activities, and we are appalled by you and your actions! Now, begone!");
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18006})) then
		e.self:Say(string.format("Good work, %s! Here's a little something for your troubles. Your quick work and loyalty will be noted by the Order of Three.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(240,5,0);
		e.other:Faction(135,5,0);
		e.other:Faction(21,-5,0);
		e.other:Faction(235,-5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(9,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 10) then
		e.self:Say("Hey guys, you got any blank scroll sheets for sale? Or know where I could get some around here?");
		eq.signal(1115,3);
	end
end
