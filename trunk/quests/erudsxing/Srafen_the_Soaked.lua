local counting;

function event_spawn(e)
	eq.set_timer("DillonSpawn",170000);
	counting = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Say("Why hello there! Ahh, it's good to see a new face down [here]. So you've come to [wait] with [us] eh? That is splendid! It's been getting very boring lately.");
	elseif(e.message:findi("here")) then -- Part of Shaman Epic 1.0
		e.self:Say("Oh! Well this is where [we wait]. It's not much for looks but if you're lucky, a pretty fish will swim by. Oh, and once Dillon said he saw one of those fish women, a mermaid, he called it! Although, I'm not so sure of his state of mind, hehehe. He's been waiting here much longer than I.");
	elseif(e.message:findi("\bus\b")) then -- Part of Shaman Epic 1.0
		e.self:Say("Well, there's me, Srafen. I've been down here for, can't quite remember, a number of years, I guess. If my wife saw the condition my clothes are in, she'd whack me, I'm sure, heheh. Although I'd bet she's long since dead, probably. Then there's Dillon. He says he's been here since those people up top in Erud blew that big hole in the ground. Not sure what happened but I guess it was a long time ago. Hmmmm, who [else]?");
	elseif(e.message:findi("wait")) then -- Part of Shaman Epic 1.0
		e.self:Say("We've been waiting quite some time, really. I have been here the least amount of time, but that doesn't help keep the boredom away, heheh. What are we waiting for, you ask? HehehHAahahah! What are we waiting for?? Heheheh, what a silly question! It's quite obvious if you take the time to think about it. Heh. Ummm.. I'm really not sure.");
	elseif(e.message:findi("else")) then -- Part of Shaman Epic 1.0
		e.self:Say("Ahh, yes, there's also a really old guy I've only seen a couple times, name's Froham. Whew, he is really old, and not much of a talker. Mostly mumbles from time to time. Dillon says he's been here since Erud first took his people across the sea. Not sure who this Erud feller is but Froham isn't in the best of shape, so it must have been a LONG time ago. Froham did mention there's one other guy but we've never seen him. He apparently had something to do with the Combine Empire, no idea what that is though.");
	elseif(e.message:findi("not an illusion")) then -- Part of Shaman Epic 1.0
		e.self:Say("Awww, well that's too bad. Although illusions and real people don't seem to be much different at times, so, please stay and keep Dillon and me company. We could use it, right Dillon?");
		eq.signal(98051,1);
	end
end

function event_signal(e)
	if(e.signal == 0) then
		e.self:Say("Hey there, Dillon! Good to see you again, I think.");
	elseif(e.signal == 1) then
		e.self:Emote("looks around frantically a moment then laughs and says, 'Ohhh, them! Hehehe! This is a friend of mine come to wait with us. Isn't that exciting, Dillon? And it's not just an illusion, I don't think! Say, are you [an illusion], shaman?");
	end
end

function event_timer(e)
	if (e.timer == "DillonSpawn") then
		counting = counting + 1;
	end
	if(counting == 1) then
		eq.spawn2(98051,0,0,4198.4,-1563.4,-291.5,152);
	elseif(counting == 5) then
		e.self:Say("Hey Dillon, why don't you tell us again about what happened up top? You know, where they blew that big hole into the ground.");
		eq.signal(98051,0);
	elseif(counting == 6) then
		eq.start(58);
		e.self:Say("Okay, well, I've had enough. Yet again, we've waited for nothing. Sometimes I really wonder if the spirits are real after all. Well I for one am going to go find something fun to do - this is obviously a waste of time. Come with me, shaman, it'll be great fun! Fairwell Dillon.");
		eq.signal(98051,2);
	elseif(counting == 7) then
		eq.spawn2(98047,0,0,4208.8,-1588.6,-291.7,205);
		eq.stop_timer("DillonSpawn");
		eq.depop();
	end
end

-- Srafen_the_Soaked