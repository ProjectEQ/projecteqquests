function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why, hello there, " .. e.other:GetName() .. "! I am Jusean, loyal member of the League of Antonican Bards. You look like the reliable sort, maybe you could help me out for a bit, huh? It's about time for our field agents to turn in their [watch reports], and I need someone to go pick them up for me.");
	elseif(e.message:findi("watch report")) then
		e.self:Say("We always have someone stationed on watch duty at the two main entries to the city to keep an eye on what is happening around Qeynos. We have [Anehan and Behroe] down at the docks, and [Leanon and Quinon] working the North Gate.");
	elseif(e.message:findi("anehan and behroe")) then
		e.self:Say("Here, if you take this to Anehan or Behroe down at the docks, and then return their report to me as soon as you can, I will give you a small reward.");
		e.other:SummonItem(18021);
	elseif(e.message:findi("leanon and quinon")) then
		e.self:Say("Leanon is in charge of the day shift at the North Gates of Qeynos, and Quinon is stationed there during the night. Please take this to either of them, have them fill it out, and then return it to me as soon as you can.");
		e.other:SummonItem(18020);
	elseif(e.message:findi("father")) then
		e.self:Say("My father Heltin disappeared while on a voyage aboard the Sea King. A group of troll pirates attacked and boarded the ship. Ginleen Harltop and the steel warriors traveling with them managed to fight them off, but took many casualties. My father was one of the bodies that was not accounted for. They found his song book floating in the water near the boat. The red water soaked through it's pages told more of the story then I ever care to know.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Emote("growls, revealing his fangs.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local item_check = 0;

	if(item_lib.check_turn_in(e.trade, {item1 = 59023})) then
		e.self:Emote("peers intently through several pages of the book, mumbling quietly under his breath as he does. His gaze falls on one page in particular as his eyes begin to widen as they pass over each line. He begins scribbling frantically across the pages in between the lines. 'Take this, who ever wrote it was obviously a student of my father. The style is unmistakable. I've written some notes up for you so it should be easier to read. Take this back to Kardin and he'll teach it to you.'");
		e.other:SummonItem(59024);
		item_check = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 59042})) then
		e.self:Say("My father gave you this just before he died?! So he's been alive all these years in the mines of Brokenskull Rock. What a bitter end for such a talented minstrel. I will transcribe this song for you " .. e.other:GetName() .. ", but you must promise to use it to help those like my father, trapped in an unnatural insanity. I pray that you will not fall to the same fate.");
		e.other:SummonItem(59001);
		item_check = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18023})) then
		e.self:Say("Good job. I hope Behroe wasn't sleeping on the job again when you talked to him. Hmm, the docks seem to be a hotbed of activity after the sun goes down. Thanks for your quick work, " .. e.other:GetName() .. ", here's a little cash for your efforts.");
		item_check = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18024})) then
		e.self:Say("Ah, very good. I'll make sure to note Leanon's report in our journals. Here's a little something for your troubles, " .. e.other:GetName() .. ".");
		item_check = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18022})) then
		e.self:Say("Ah, very good. I'll make sure to note Anehan's report in our journals. Here's a little something for your troubles, " .. e.other:GetName() .. ".");  -- not live text
		item_check = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18025})) then
		e.self:Say("Ah, very good. I'll make sure to note Quinon's report in our journals. Here's a little something for your troubles, " .. e.other:GetName() .. "."); -- not live text
		item_check = 1;
	end
	
	if(item_check == 1) then
		e.other:Ding();
		e.other:Faction(192,3,0); -- league of antonican bards
		e.other:Faction(184,3,0); -- knights of truth
		e.other:Faction(135,3,0); -- guards of qeynos
		e.other:Faction(273,-3,0); -- ring of scale
		e.other:Faction(207,-3,0); -- mayong mistmoore
		e.other:AddEXP(500);
		e.other:GiveCash(10,2,0,0);
	elseif(item_check == 2) then
		e.other:Ding();
		e.other:Faction(192,10,0); -- league of antonican bards
		e.other:Faction(184,10,0); -- knights of truth
		e.other:Faction(135,10,0); -- guards of qeynos
		e.other:Faction(273,-30,0); -- ring of scale
		e.other:Faction(207,-30,0); -- mayong mistmoore
		e.other:AddEXP(2500);	
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
