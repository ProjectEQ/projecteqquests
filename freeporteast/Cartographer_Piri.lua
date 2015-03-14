function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! Would you have a moment? I'm in need of some assistance. [yes]");
	elseif(e.message:findi("yes")) then
		e.self:Say("Thank you! I'll make it worth your while. I recently discovered the remains of an odd little map that may detail the distant Gulf of Gunthak. The map itself, however, is in a horrible state... a suspiciously horrible state if you ask me. Much of it is [missing].");
	elseif(e.message:findi("missing")) then
		e.self:Say("The pirates of Broken Skull Rock have purposefully destroyed any accurate maps to protect the secrecy of their base. Three key parts are damaged. The compass notation, the legend and the coordinate label are all gone. Take this Cartography Binder. Use it to [collect] the fragments.");
		e.other:SummonItem(17710); -- Cartography Binder
	elseif(e.message:findi("collect")) then
		e.self:Say("No doubt the pirates will have some of the fragments. Search Broken Skull Rock, paying careful attention to Gunthak and Dulak Harbor. An accurate map must be made. It is the first step in breaking the pirates' hold on the region. Good luck. The three pieces needed are A Coordinate Label, A Compass Notation, and A Map Legend.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 63005})) then -- Completed Cartography Binder
		e.self:Say("Incredible! With a little work, I will be able to create a finished map of the Gulf of Gunthak. No longer will the pirates be able to keep their lair a secret. Thank you! Please take this as a reward for your efforts.");
		e.other:SummonItem(63048); -- Skyfall Seeker
		e.other:Ding();
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Cartographer_Piri