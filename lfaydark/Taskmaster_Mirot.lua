-- Taskmaster Mirot quest/event in Lesser Faydark for Cleric 1.5 // Harmony of the Soul Epic --Drogerin
-- Taskmaster Mirot is invulnerable to attack/spells unless Cleric has item he wants
-- A Wayfayer in camp is invulnerable to attack/spells unless Cleric has item Taskmaster Mirot wants, They then become agro.

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["cleric_epic"] >= "4" and e.message:findi("hail")) then
		e.self:Emote("looks at you for a moment before his eyes shine with recognition. 'Its you, I've heard about you. We will not allow you to interfere with our plans again!");
		e.self:SetInvisible(2);
		e.self:SetTargetable(false);
		e.self:GMMove(3435.6,-79.3,-2.8,500);
		eq.depop_all(57152);
		eq.spawn2(57153,0,0,3430,-13.5,-1.9,180); -- NPC: #a_Wayfarer
		eq.spawn2(57153,0,0, 3425,-25 ,-1.9,330); -- needs_heading_validation
		eq.spawn2(57153,0,0, 3430,-33.5 ,-1.9,0); -- NPC: #a_Wayfarer
		eq.spawn2(57153,0,0, 3443,-25.5 ,-1.9,360); -- NPC: #a_Wayfarer
		eq.spawn2(57153,0,0, 3440,-33.5 ,-1.9,270); -- needs_heading_validation
		eq.spawn2(57153,0,0, 3443,-15.5 ,-1.9,360); -- NPC: #a_Wayfarer
	elseif(e.message:findi("hail")) then
			e.self:Say("I am sorry, we don't currently have any work available. We are still setting up, and cleaning up the orcish filth from this area. Return later, I should have some work available.");
	end

end

function event_spawn(e)
		eq.spawn2(57152,0,0,3430,-13.5,-1.9,180); -- NPC: a_Wayfarer
		eq.spawn2(57152,0,0, 3425,-25 ,-1.9,330); -- needs_heading_validation
		eq.spawn2(57152,0,0, 3430,-33.5 ,-1.9,0); -- NPC: a_Wayfarer
		eq.spawn2(57152,0,0, 3443,-25.5 ,-1.9,360); -- NPC: a_Wayfarer
		eq.spawn2(57152,0,0, 3440,-33.5 ,-1.9,270); -- needs_heading_validation
		eq.spawn2(57152,0,0, 3443,-15.5 ,-1.9,360); -- NPC: a_Wayfarer
end

function event_signal(e)
	if (e.signal == 1) then
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(57153) == false) then
			eq.spawn2(57151,0,0,3420,-33.5,-1.9,82); -- NPC: #Taskmaster_Mirot
			eq.spawn2(57154,0,0,3430,-13.5,-1.9,180); -- NPC: Reanimated_Minion
			eq.spawn2(57154,0,0, 3425,-25 ,-1.9,330); -- needs_heading_validation
			eq.spawn2(57154,0,0, 3430,-33.5 ,-1.9,0); -- NPC: Reanimated_Minion
			eq.spawn2(57155,0,0, 3443,-25.5 ,-1.9,360); -- NPC: Reanimated_Minion
			eq.spawn2(57155,0,0, 3440,-33.5 ,-1.9,270); -- needs_heading_validation
			eq.spawn2(57155,0,0, 3443,-15.5 ,-1.9,360); -- NPC: Reanimated_Minion
		end
	end
	if (e.signal == 2) then
		eq.depop_with_timer();
	end
end


 -- After the last Wayfayer is dead, the camp will respawn with undead skeletons ( the same # as wayfayers to start ) some white, some brown.
 -- white skeletons are mezzable, brown skeletons are not. Once Taskmaster Mirot is dead he can spawn a chest.
 
