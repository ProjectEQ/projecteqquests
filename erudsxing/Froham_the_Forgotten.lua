local counting;

function event_spawn(e)
	eq.set_timer("FrohamDepart",330000);
	counting = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then -- Part of Shaman Epic 1.0
		e.self:Emote("looks up at you and mumbles a brief greeting. He appears uncomfortable around others.");
	elseif(e.message:findi("who are you")) then -- Part of Shaman Epic 1.0
		e.self:Emote("glances up at you, fiddling with his bony fingers and mumbles, 'Mmmm me name's Froham..I'm 'ere [waitin].");
	elseif(e.message:findi("waitin")) then -- Part of Shaman Epic 1.0
		e.self:Say("Just waitin' . . . it'll [be ere soon], I s'pose.");
	elseif(e.message:findi("be here soon")) then -- Part of Shaman Epic 1.0
		e.self:Emote("obviously has trouble communicating. He shifts uncomfortably and says, 'Well I'm not sure, but it's real important. I been 'ere fer a [long time], a real long time. So I'll keep waitin' til it comes.");
	elseif(e.message:findi("long time")) then -- Part of Shaman Epic 1.0
		e.self:Say("Been 'ere since Erud sailed over with his friends. They let me catch a ride on their ship after I told them I needed to come 'ere to wait. He was a nice fella, real smart. Though I'm thinkin' he's dead by now. Maybe [Abe] knows fer sure. Abe's been here longer'n me, even.");
	elseif(e.message:findi("abe")) then -- Part of Shaman Epic 1.0
		e.self:Say("Yeah, Abe's an old guy. Well, he's kinda beyond bein' old if ye know what I mean. Not all together either. His mind floats all over like the sea around us. But he's got enough sense to wait here like he's done fer, well, fer dang near ever. If ye see him, and he ain't much fer talkin' straight, ask him about [a broken arrow]. Not sure what it means to him but it seems to bring him around.");
	end
end

function event_timer(e)
	
	if (e.timer == "FrohamDepart") then
		counting = counting + 1;
	end
	if(counting == 1) then
		e.self:Emote("sighs heavily and says, 'Looks like it's not comin'. You know, Abe told me of a great treasure a ways away from here, guarded by one o' them girls with fish tails. I always wanted to go but those two jokers, Dillon and the other young one, never had the guts. Why don't ye come with me, shaman? We'll split the treasure fifty-fifty, fair and square.");
		eq.start(58);
	elseif (counting == 2) then
		eq.spawn2(98050,0,0,4209.4,-1575.5,-289.4,181);
		eq.depop();
		eq.stop_timer("FrohamDepart");
	end
end

-- Froham_the_Forgotten