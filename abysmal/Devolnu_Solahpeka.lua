function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail to you too.");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if e.wp == 14 then
		eq.set_timer("emote", 2 * 60 * 1000);
	elseif e.wp == 15 then
		eq.stop_timer("emote");
	end
end

function event_signal(e)
	local x,y = e.self:GetX(), e.self:GetY();
	if e.signal == 1 then
		e.self:Emote("smiles crookedly at his companions.  'Sorry ta here that, friend.  I can't feel too sorry, though.  I had the world's largest tuna on my line today.  It musta been ten feet long!  I tried walkin' it to the dock, since there ain't no way my line could carry it up to the rail, but it bit through the line just as I was makin' my way down the stairs.'");
		eq.signal(279043,1,15000); -- NPC: Stu_Girbnol
	elseif e.signal == 2 then
		e.self:Say("Bah.  You just don't know what yer doin'.  Have you ever caught a fish with no hook and no bait?  I have.  Did it last weekend.  I was at the water just relaxin' when this big tuna shows itself.  I look around and the only things nearby is some cast-off line and a pebble.  Well, I skillfully turned that line into a noose, with that pebble as an anchor.  It took a lot of careful work to get that fish into that noose and haul it up onto the deck, but I did it.  In this business you have to be smart if you want to be good.");
		eq.signal(279046,1,15000); -- NPC: Barny_Magmilg
	elseif e.signal == 3 then
		e.self:Say("That's nothin'.  Why, just last week I had the misfortune of being bumped into the water by Rensik on his rounds.  The fellow didn't even notice and just kept on walkin'.  I went under pretty deep, considerin' the fall.  When I got my bearings I started up.  What was odd was the fact that the sun seemed to be directly overhead, but I knew it was nearly dusk.  When I got a few feet closer to the surface I realized that it wasn't the sun I was seeing, it was a jellyfish!  Before I had noticed I was surrounded by its poisonous tentacles!  I knew of only one way out.  I released all the air I had in my lungs, blew it right up under the thing.  As the bubbles went up, I went down.  I just barely managed to dive out from between the stingers and get up to the surface before I drowned.");
		eq.signal(279046,3,15000); -- NPC: Barny_Magmilg
	elseif e.signal == 4 and x == 249 and y == -222 then
		e.self:Emote("leers at the waitress 'Anything you bring me will taste like heaven!  If I have to choose, I'll have a light beer.'");
	elseif e.signal == 5 then
		eq.depop_with_timer();
	end
end

function event_timer(e)
	e.self:Emote(eq.ChooseRandom(" attaches some bait to his hook and casts his line into the water."," removes the hook from his line and attaches a very ornate-looking fly in its place.", " reels in his line and casts again.", " rummages through his box of tackle, looking for his favorite lure.", " lets out a sigh of frustration as he casts his line out into the dark waters below."));
end
