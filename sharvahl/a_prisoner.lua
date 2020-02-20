-- A prisoner used in rogue 1.5 prequest // flavor only, no real use other than to let the player know where to find the keys. NPCID 155328

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:QuestSay(e.other," leans forward and whispers. 'Psst, you'll never get the guards here to budge. They don't make deals, don't take bribes and they are much too careful to catch by surprise. If you promise to help me, I can tell you [where to find the keys].",{speak_mode = SpeakMode.Emote});
	elseif (e.message:findi("where to find the keys")) then
		e.self:QuestSay(e.other," nods and continues to whisper, 'Before we were brought to these cells, we were held in Katta briefly. I bet you'd find a keys to these blasted cages and another key to our shackles t here, and the best part is t hat the guards are much more careless... Are you with me? [Do you understand]'",{speak_mode = SpeakMode.Emote});
	elseif (e.message:findi("Do you understand")) then
		e.self:QuestSay(e.other,"Lift the keys, kill them, whatever. I don't care. Just do it quickly and do it quietly. Don't know how much longer before they move us to a new location. This may be our only chance to escape.");
	end
end
