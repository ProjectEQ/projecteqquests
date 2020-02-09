function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("lets out a cry of pain as your words reach her ears.  'No!  No more noise!  No more experiments!'");
	elseif(e.message:findi("experiment")) then
		e.self:Emote("screams, 'Stop! I can't stand it leave me alone you beasts!' Frekka clasps her hands to her ears and shakes her head.");
		eq.signal(112034,1); -- NPC: Brumen_Firehammer
	elseif(e.message:findi("beast")) then
		e.self:Emote("howls in pain. 'Get out of my head! Get out of my head! Get them out of my head! Stop eating my mind!' ");
	elseif(e.message:findi("eating your mind")) then
		e.self:Emote("tenses and trys to ignore you.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("tenses and trys to ignore you.");
	end
end
