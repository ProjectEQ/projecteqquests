function event_spawn(e)
	eq.set_timer("ready",300000);
end

function event_timer(e)
	if(e.timer == "ready") then
		e.self:Say("What a cheerful crowd.");
		eq.stop_timer("ready");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you! Sit and have a drink. I shall be playing soon enough.");
	end
end

function event_signal(e)
	SingASong = eq.ChooseRandom(1,2,3);
	if(SingASong == 1) then
		e.self:Say("Look around you. Stand up tall!! Feel for the poor and never have a cold heart. Becausee we are all in this. We are not like the rest. We're all here together and know we are the best. So Norrath, can't you see the error in your ways? You're living separated each and every day. Don't be thinking that we don't want you, because, Norrath, we do. Freeport is the only place where your friend can be from afar. I hope you enjoyed that one.");
		eq.signal(10199,1);
		eq.signal(10182,1);
	elseif(SingASong == 2) then
		e.self:Say("Within my head and inside my brain, I hold the key. It is not much more than the size of a pea. With it, I have the power to set free Oggok city. Open up its doors to all that is pretty. Instead, here I am in a pile of my own dug, smelling quite dingy. Drinking ogre swill with which I am stingy. I may have the key, but the point is quite moot. For you see, I am nothing more than a dumb, smelly, ogre brute. Thank you. I hope you enjoyed that one.");
		eq.signal(10012,2);
	elseif(SingASong == 3) then
		e.self:Say("All clap and pass the ale. Sir Lucan is in charge so don't set sail. All clap and pass the ale. Sir Lucan is in charge andhe shall never fail. He saved our fair city when the others had fled. Off on a crusade, or so they said. All clap  and pass the ale, Sir Lucan is in charge so don't you bail. All clap and pass the ale, Sir Lucan is in charge so sing or go to jail. All clap and pass the ale, Sir Lucan beat the orcs and next is Bayle. Thank you. I hope the Freeport citizens liked that one.");
		eq.signal(10199,3);
	end
end

-- END of FILE Zone:freporte -- Branis_Noolright