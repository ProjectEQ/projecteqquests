function event_spawn(e)
	eq.set_timer("ready",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!! I am Trolon Lightleer. Harmonizer of the soul. Please sit and order an ale. I shall be playing soon.");
	end
end

function event_timer(e)
	if(e.timer == "ready") then
		e.self:Say("What a cheerful crowd.");
		eq.stop_timer("ready");
	end
end

function event_signal(e)
	SingASong = eq.ChooseRandom(1,2);
	if(SingASong == 1) then
		e.self:Say("Here's one for Sir Lucan... He's just a ruler. In a long line of rulers. Looking for a few more orcs to slay. They say that he fights them with one hand tied to his back. And he won't leave Freeport till you remember his name. Thank you.");
	elseif(SingASong == 2) then
		e.self:Say("Look around you. Stand up tall!! Feel for the poor and never have a cold heart. Becausee we are all in this. We are not like the rest. We're all here together and know we are the best. So Norrath, can't you see the error in your ways? You're living separated each and every day. Don't be thinking that we don't want you, because, Norrath, we do. Freeport is the only place where your friend can be from afar. I hope you enjoyed that one.");
		eq.signal(10199,1);
		eq.signal(10182,1);
	end
end