function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s! Are you a [citizen of Qeynos] or are you a [traveler of sorts]?",e.other:GetName()));
	elseif(e.message:findi("traveler of sorts")) then
		e.self:Say("Ah, yes! Traveling can be truly dangerous. Have you ever been to Erudin or do you not care for that place?");
	elseif(e.message:findi("erudin")) then
		e.self:Say("The trip to Erudin takes far too long. I have been designing a [titanic bridge] which will shorten the trip. Well, I cannot take full credit, most of the plans are being designed by [three great engineers].");
	elseif(e.message:findi("three great engineers")) then
		e.self:Say("They are some of the finest engineers in all of Norrath. Young, they may be, but as smart as the wisest architects I have ever met. That reminds me.. I must have a list of the engineers somewhere.. where is it?");
	elseif(e.message:findi("citizen of qeynos")) then
		e.self:Say("Then you are aware of how few ships come and go to the continent of Erudin. The port authority is even planning to tax all passage aboard the ships. You will be happy to know that a few other engineers and I are designing a [titanic bridge].");
	elseif(e.message:findi("titanic bridge")) then
		e.self:Say("My grand plan has always been to erect a bridge which would span the distance between Qeynos and Odus. It would bypass the city of Erudin. Antonius Bayle would take full control of the bridge and its adjacent territories. This has had some opposition in Erudin, but for the most part, they just believe it is impossible to build such a bridge.");
	elseif(e.message:findi("donation")) then
		e.self:Say("I would be pleased to help out such a noble organization. Here you are, my good friend. See you at weekly services!");
		e.other:SummonItem(13290); -- donation (donation 1)
	end
end

function event_waypoint_depart(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	if(e.wp == 0) then
		e.self:Emote("drops something as he walks away. He doesn't seems to notice.");
		eq.set_proximity(xloc - 10,xloc + 10,yloc - 10,yloc +10);
	elseif(e.wp == 13) then
		eq.clear_proximity();
		eq.stop_timer("repeat");
	elseif(e.wp == 36) then
		e.self:Emote("picks up a discarded item from the ground and says 'Don't people have enough respect for our grand city to not throw things onto the streets?!'");
		eq.set_timer("repeat",320000);
	end
end

function event_enter(e)
	e.other:Message(15,"A note on the ground catches your eye.");
	e.other:SummonItem(18835);
	eq.clear_proximity();
end

function event_timer(e)
	e.self:Say("picks up a discarded item from the ground and says 'Don't people have enough respect for our grand city to not throw things onto the streets?!'");
end
