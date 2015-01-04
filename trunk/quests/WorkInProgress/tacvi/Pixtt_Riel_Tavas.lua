-- Pixtt_Riel_Tavas
--[[
--Each Golem hits for 2500. Start FD I think
--??and must be tanked both at the same time, and killed within a few minutes of each other.
5 minutes and nothing happened only killing one

Spells:
xDelusional Visions from the start.
xprocs Wrath of the Ikaav

At 30% she spawns an unstable construct, low hp fast hitting golems who, if killed or left mobile for too long explode into a 3kae.
Cataclysm of Stone 4661

At 25% the Pixxt begins her first and only AE.
Ikaav's Venom

notes
This final 30% is the danger moment.

At 30% the 'An Instable Construct' are spawned and must be contained. To do this, 
have your Enchanters set up a Circle of Dreams (Word of Morell works too but more resists...) chain, 
with each CoD landing at just after another Enchanters has landed. 
The secondary spell should be PBAE stun, single mezz, AE mezz(wake of felicty for example)

 26% have Clerics switch to spam heals. Thiis is due to the AE that starts at 25% which has a knockback effect to it
 
 Once the Pixxt is dead, you still have the small matter of the 3k exploding Golems to deal with. Once Pixxt dies, 
 have your raid force sprint back to zone in, leaving in Pixxt room, the Enchanter chain and a wizard or two. 
 Once all celar of the room, have the wizard AE nuke and wipe the Enchanters and himself out.

 "You dare enter my chambers and then try to leave? Your punishment will be quite severe"

 he says, So it seems you are not so easily defeated after all.  I am through toying with you fools. Prepare for the reality of death.
 
 Riel's body begins to speed up as her attacks become increasingly vicious

 he says, You and your friends are starting to annoy me.  Come forth my little experiments.  Choose one of these fools and show them the surprise you have waiting.

 Thats it!  You have past the point of being bothersome. I grow weary of this encounter. It is time for it to end


 Riel's body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room. 'This is not over. My commander will destroy you for this and when he does I hope it is my power he is weilding'

--]]

---
-- @param NPC#event_spawn e
function event_spawn(e)
	--spawn the two starting golems 
	--a_corrupted_construct (298002)
	eq.spawn2(298002,0,0,212,-572, -7, 193)
	eq.spawn2(298002,0,0,212,-600, -7, 193)

	eq.set_next_hp_event(90)
end

function event_combat(e)
	if (e.joined == true) then
		e.self:Say("You shall regret trespassing into my chambers. Rise my minions and show them how well I have learned to use the power of this land's creatures. Destroy them all. Leave only enough to feed the hounds")
		eq.set_timer("Delusional", 30000)
	else
		-- Wipe stuff
		eq.get_entity_list():FindDoor(23):SetLockPick(0)
	end
end


function event_hp(e)
	if (e.hp_event == 90) then
		--lock door behind her
		eq.get_entity_list():FindDoor(23):SetLockPick(-1)
		eq.set_next_hp_event(50)
	elseif (e.hp_event == 50) then
		-- Hits a little harder
		--quest::modifynpcstat("max_hit",4500);
		e.self:ModifyNPCStat("max_hit",tostring(e.self:GetMaxDMG()*1.1))
		e.self:Say("So it seems you are not so easily defeated after all. I am through toying with you fools. Prepare for the reality of death.' Riel's body begins to speed up as her attacks become increasingly vicious")
		e.self:Emote("'s body begins to speed up as her attacks become increasingly vicious")
		eq.set_next_hp_event(30)

	elseif (e.hp_event == 30) then
		--spawn 3 mini exploding golems every 30 seconds
		eq.set_timer("SpawnGolem", 30000)
		e.self:Say("You and your friends are starting to annoy me.  Come forth my little experiments.  Choose one of these fools and show them the surprise you have waiting.")
		eq.set_next_hp_event(25)
	elseif (e.hp_event == 25) then
		--add Ikaav's Venom AE
		eq.set_timer("VenomAE", 30000)
		eq.set_next_hp_event(10)
	elseif (e.hp_event == 10) then
		-- At approximately 10% health, she increases her attack speed and begins flurrying much more
		e.self:ModifyNPCStat("attack_speed",tostring(e.self:GetAttackSpeed()*1.2))
		e.self:Say("Thats it!  You have past the point of being bothersome. I grow weary of this encounter. It is time for it to end")
	end
end

function event_timer(e)
	--Delusional Vision single target DD/Drunk whole fight
	if (e.timer == "Delusional") then
		e.self:SpellFinished(889, e.self:GetHateTop()) --CastToClient?
	--Ikaav's Venom 751
	elseif (e.timer == "VenomAE") then
		e.self:CastSpell(751,e.self:GetID())
	elseif (e.timer == "SpawnGolem") then
		--spawn 3 mini golems
		--an_unstable_construct (298045)
		eq.spawn2(298045,0,0,150, -565, -7,0)
		eq.spawn2(298045,0,0,157, -622, -7,0)
		eq.spawn2(298045,0,0,216, -585, -7,0)
	end
end

function event_death_complete(e)
	e.self:Emote("'s body falls to the stone floor in a puddle of blackened blood. You step back as she slashes one last time, connecting with nothing but the stale air of the room. 'This is not over. My commander will destroy you for this and when he does I hope it is my power he is weilding'")
	eq.zone_emote(15, "With the death of the great beast, the seals on the doors fade away. Your path is now clear.")

	-- Open doors
	-- Door before her
	eq.get_entity_list():FindDoor(23):SetLockPick(0)
	-- Doors after her
	eq.get_entity_list():FindDoor(22):SetLockPick(0)
	eq.get_entity_list():FindDoor(17):SetLockPick(0)

end