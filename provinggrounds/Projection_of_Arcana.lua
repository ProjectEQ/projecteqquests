-- Zone: provinggrounds
-- NPC.: Projection_of_Arcana
--

local compass    = { zone="provinggrounds", x=1792.02, y=-1031.02, z=-310.217 }
local safereturn = { zone="provinggrounds", x=1793.75, y=-1016.125, z=-308.25, h=0 }
local zonein     = { x=0.0, y=-37.0, z=-0.875, h=0 }

local efficiency = {
	expedition = { name="Proving Grounds: The Mastery of Efficiency", min_players=2, max_players=6 },
	instance   = { zone="chambersd", version=1, duration=eq.seconds("1h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

local specialization = {
	expedition = { name="Proving Grounds: The Mastery of Specialization", min_players=6, max_players=54 },
	instance   = { zone="chambersd", version=2, duration=eq.seconds("3h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

function event_say(e)
	local dz = nil;
	if e.message:findi("hail") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Arcana says, 'Halt, " .. eq.get_race_name(e.other:GetRace()) .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Arcana, keeper of the trials of Efficiency and Specialization.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Efficiency") .. "] or [" .. eq.say_link("Specialization") .. "]?'")
	elseif e.message:findi('small') then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Arcana says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'")
	elseif e.message:findi("large") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Arcana says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")
	elseif e.message:findi("efficiency") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Arcana says, 'While it can be admirable to defeat the opposition while in prime condition, a more accurate test of one's mettle is to tackle an opponent while fatigued and weary - yet still walk away victorious.  If you have this ability, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(efficiency);

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("2h"));
		end
	elseif e.message:findi("specialization") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Arcana says, 'At times it pays to be focused in your abilities, and at times it does not.  This trial will test your skill at using your strengths when they are most effective, and otherwise relying on your companions.  If you have this ability, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(specialization);

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("3h"));
		end		
	end
end
