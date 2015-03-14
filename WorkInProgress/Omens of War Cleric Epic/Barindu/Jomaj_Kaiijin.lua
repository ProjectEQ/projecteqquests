-- Used in Cleric 1.5 Epic Quest // Harmony of the Soul --Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please don't hurt me! Oh, you aren't one of them. Are you here to ask about the [Wayfarers] that I spoke with?");
	elseif(e.message:findi("Wayfarers")) then
		e.self:Say("They came to me, asking about the Legion. They wanted to know information on the ranks, how to contact the leaders. They claimed they were looking for information to infiltrate the Legion, but they seemed a little off, even for the Brotherhood. They gave me this note to pass on to the Legion. The whole situation did not seem right to me, you may have the [note]. If they were honestly with the Brotherhood return it to me, and I'll do what they asked. Anything to be rid of these creatures.");
	elseif(e.message:findi("note")) then
		e.self:Emote("reaches into his tattered robes. As he begins to pull out the note he is impaled in the chest with an arrow. A dark figure melts from the shadows and pulls the note from the hand of the body.");
		eq.spawn2(283102,0,0,-665.7,133.5,-121.3,39)  -- Spawns "A Kyv Runner" to the immediate right of Jomaj Kaiijin.
		eq.depop_with_timer(); -- Jomaj despawns & respawns with a 2 hour timer. Kyv if not killed will remain up until Jomaj respawns and will despawn.
	end
end