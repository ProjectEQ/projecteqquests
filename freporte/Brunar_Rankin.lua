-- items: 69934
function event_say(e)
local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		if(qglobals["paladin_epic"] >= "2") then
			e.self:Say(e.other:GetName() .. "! Are you looking for a Koalindl? I have heard some knights such as yourself were searching for that sacred fish of Qeynos. I saw one come through here recently. An evil looking Iksar had one in some sort of stasis spell and the fish didn't look too good. Now, I'm not sure what exactly the Iksar was going to do with it, but I did see a chunk of the fish fall into the water. A few minutes later I ended up fishing up an odd looking fish scale. Immediately after I was attacked by a large and evil fish! Luckily I was carrying with me a flaying dagger and I was able to slay the evil fish before it could hurt me. Here is a note I found on the dock before the Iksar left. You must put a stop to whatever it is this Iksar is planning on doing!");
			e.other:SummonItem(69934); -- Item: Iksar's Note
			eq.set_global("paladin_epic","3",5,"F");
		else
			e.self:Say("How are you? Please excuse my stench. I fish all day and night just to feed my large family. You look like an adventurer. That must be exciting. I am but a humble fisherman. Maybe someday we shall both be rich. You by your treasure and me by my catch.");
		end
	elseif(e.message:findi("steal from lenka")) then
		e.self:Say("How dare you accuse me of being a thief!? I labor hour after hour trying to catch one fish which will bring me one copper piece to buy one slice of bread which I will split into five pieces to feed me, my sick wife and three little children, one of whom has the plague!! Poor little Repi. Now please, leave this humble little fisherman alone!");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	if(e.wp == 13) then
		e.self:Say("Here is my catch for today, Gregor");
		eq.signal(10171,1); -- NPC: Gregor_Nasin General Supplies
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
