-- Heretic remains

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! This is no place for you. Make sure you keep it that way. We do not need any more [hollow men].");
	elseif(e.message:findi("hollow men")) then
		e.self:Say("There is only one sentence in Erudin, death!! And death by purging is the most common. The insides of the criminal are literally pulled out chunk by chunk through the mouth. Then the hollow man is set adrift to float the seas of Erud's Crossing, his body cleansed of all anarchy.");
	elseif(e.message:findi("heretic's remain")) then
		e.self:Say("I am afraid the heretic prisoner has escaped. There was a skirmish on the palace grounds so I went to assist. When I returned to my post he was gone! I don't know how... he was locked away in the first cell, across from that no-good, thieving gnome, and it is impossible to break the lock with or without magic. We will find him soon. Tell Guildmaster Markus he has escaped.");
	end
end

-- EOF zone: erudnint ID: 23022 NPC: Warden_Lius