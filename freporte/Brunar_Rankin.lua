function event_say(e)
local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if(qglobals["paladin_epic"] >= "2") then
			e.self:Say(e.other:GetName() .. "! Are you looking for a Koalindl? I have heard some knights such as yourself were searching for that sacred fish of Qeynos. I saw one come through here recently. An evil looking Iksar had one in some sort of stasis spell and the fish didn't look too good. Now, I'm not sure what exactly the Iksar was going to do with it, but I did see a chunk of the fish fall into the water. A few minutes later I ended up fishing up an odd looking fish scale. Immediately after I was attacked by a large and evil fish! Luckily I was carrying with me a flaying dagger and I was able to slay the evil fish before it could hurt me. Here is a note I found on the dock before the Iksar left. You must put a stop to whatever it is this Iksar is planning on doing!");
			e.other:SummonItem(69934);
			eq.set_global("paladin_epic","3",5,"F");
		else
			e.self:Say("How are you? Please excuse my stench. I fish all day and night just to feed my large family. You look like an adventurer. That must be exciting. I am but a humble fisherman. Maybe someday we shall both be rich. You by your treasure and me by my catch.");
		end	
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");

	if(qglobals["paladin_epic"] >= "3" and item_lib.check_turn_in(e.trade, {item1 = 69929, item2 = 69930, item3 = 69931, item4 = 69932})) then
		e.self:Say("So this is what happened to the Koalindl? This is sad indeed. I have heard that you have stopped a greater tragedy from occuring by treating the pestilence that was being brought to the seas. You have done a very good job, " .. e.other:GetName() ..". I present you with a seal of nobility that was given to me long ago. This seal has granted me audiences with many of the different races of Norrath, including the Ring of Scale. Perhaps it will aide you in your journeys. Thank you again, sir.");
		eq.set_global("paladin_epic","4",5,"F");
		e.other:SummonItem(69933);
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end

function event_waypoint_arrive(e)
	if(e.wp == 13) then
		e.self:Say("Here is my catch for today, Gregor");
		eq.signal(10171,1);
	elseif(e.wp == 34) then
		e.self:Say("Ho hum, what a lovely day !");
		e.self:SetRunning(true);
	elseif(e.wp == 39) then
		e.self:SetRunning(false);
	elseif(e.wp == 44) then
		e.self:SetRunning(true);
	elseif(e.wp == 59) then
		e.self:SetRunning(false);
	end
end

-- END of FILE Zone:freporte -- Brunar Rankin