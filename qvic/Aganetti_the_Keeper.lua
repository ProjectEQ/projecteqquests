-- Aganetti_the_Keeper (295065)
-- Request NPC for Inktu`Ta

local inktuta = "Inktu'ta the Unmasked Chapel"
local inktuta_raid = {
	expedition = { name="Inktu'ta the Unmasked Chapel   ", min_players=18, max_players=54 },
	instance   = { zone="inktuta", version=0, duration=eq.seconds("6h") },
	compass    = { zone="qvic", x=-974.94, y=-1346.20, z=-500.81 },
	safereturn = { zone="qvic", x=-1019.46, y=-1366.74, z=-492.12, h=256 },
	zonein     = { x=0, y=180, z=-4.12, h=256 }
}

function event_say(e)
	local is_cynosure_alive = (eq.get_entity_list():IsMobSpawnedByNpcTypeID(295140) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(295149));
	local is_gm = (e.other:GetGM()); -- Not including 80 status check

	if e.message:findi("hail") then
		if is_cynosure_alive then
			e.other:Message(MT.NPCQuestSay, "Aganetti the Keeper says, 'The Cynosure's magic prevents me from allowing passage into Inktu'ta. We shall speak more after his demise.'")
		else
			e.other:Message(MT.NPCQuestSay, ("Aganetti the Keeper gestures to the end of the cavernous hallway. 'Beyond that corner lies the entrance to the forgotten chapel of Inktu'ta. The force of the blast from the portal's implosion tore a hole in the mountain, revealing the way to this place. Some things should remain unknown. Inktu'ta should have stayed buried forever. Believe me %s only a fool would disturb the halls of this cursed chapel. Will you [heed my warning] or do you wish to [continue]...?'"):format(e.other:GetCleanName()))
		end
	elseif e.message:findi("heed") then
		e.other:Message(MT.NPCQuestSay, ("Aganetti the Keeper says, 'As well you should, never return, %s never come back.'"):format(e.other:GetCleanName()))
	elseif e.message:findi("continue") then
		if not is_cynosure_alive or is_gm then
			if not is_gm and e.other:GetRaidMemberCountInZone() < 18 then
				e.other:Message(MT.NPCQuestSay, "Aganetti the Keeper says, 'I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least eighteen friends to join you on this perilous journey.")
			elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(inktuta, "Replay Timer", 54) then
				e.other:Message(MT.NPCQuestSay, "Aganetti the Keeper says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
			else
				e.other:Message(MT.NPCQuestSay, "Aganetti the Keeper says, 'Very well! If you will not heed my warning, then you have chosen to suffer the consequences. I grant you entrance to Inktu`Ta.'")
				local dz = e.other:CreateExpedition(inktuta_raid)
				dz:AddReplayLockout(eq.seconds("2h"));
			end
		else
			e.other:Message(MT.NPCQuestSay, "Aganetti the Keeper says, 'The Cynosure's magic prevents me from allowing passage into Inktu'ta. We shall speak more after his demise.'")
		end
	end
end