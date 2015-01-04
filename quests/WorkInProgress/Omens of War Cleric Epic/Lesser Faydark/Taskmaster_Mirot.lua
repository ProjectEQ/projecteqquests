-- Taskmaster Mirot quest/event in Lesser Faydark for Cleric 1.5 // Harmony of the Soul Epic --Drogerin
-- Taskmaster Mirot is invulnerable to attack/spells unless Cleric has item he wants
-- A Wayfayer in camp is invulnerable to attack/spells unless Cleric has item Taskmaster Mirot wants, They then become agro.

function event_say(e)
	if(e.other:Hasitem(56015);
		e.self:Emote("looks at you for a moment before his eyes shine with recognition. 'Its you, I've heard about you. We will not allow you to interfere with our plans again!");
		eq.depop_with_timer();  -- Taskmaster Mirot (quest) depops at this time // Wayfayers will become active and attack players in camp, need signal here to do so.
	else(e.message:findi("hail")) then
			e.self:Say("I am sorry, we don't currently have any work available. We are still setting up, and cleaning up the orcish filth from this area. Return later, I should have some work available.");
end



 -- After the last Wayfayer is dead, the camp will respawn with undead skeletons ( the same # as wayfayers to start ) some white, some brown.
 -- white skeletons are mezzable, brown skeletons are not. Once Taskmaster Mirot is dead he can spawn a chest.
 