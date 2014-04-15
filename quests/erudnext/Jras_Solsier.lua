function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Divine Light.  We are the Peacekeepers. followers of Quellious.  If you are a paladin of this temple. you can assist us by showing a desire to [protect the peace].");
	elseif(e.message:findi("protect the peace")) then
		e.self:Say("It was a fine decision.  We are in need of your services.  It seems there is a disturbance in Toxxulia Forest.  There are poachers from other nations who have sought to cause turbulence among the creatures there.  Will you help us [catch the poachers] or are you skeptical about this mission?");
	elseif(e.message:findi("catch the poachers")) then
		e.self:Say("The infidels are in Toxxulia Forest.  They have begun hunting the kobolds.  We have no love of the kobolds. but cannot allow the lands of Odus to be overrun by outsiders.  The ways of tranquility are balanced with harmony.  We will not allow chaos to take hold of our land.  Go and find these poachers.  Bring me their heads!!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13825})) then
		e.self:Say("You have served us well. The harmony of the forest shall be preserved. I have word that theses infidels were all working for one man. Find me evidence pertaining to this man. Surely one of these poachers has something which could aid in finding this man. We must stop him to stop the poachers. Go in peace.");
		e.other:SummonItem(10004);
		e.other:Ding();
		e.other:Faction(247,20,0);
		e.other:Faction(145,20,0);
		e.other:Faction(143,-20,0);
		e.other:AddEXP(500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13913})) then
		e.self:Say("You found the man?  That is excellent work, young Paladin, here take this for your trouble and we thank you once again.");
		e.other:SummonItem(15011);
		e.other:Ding();
		e.other:Faction(247,20,0);
		e.other:Faction(145,20,0);
		e.other:Faction(143,-20,0);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98041 -- Jras_Solsier