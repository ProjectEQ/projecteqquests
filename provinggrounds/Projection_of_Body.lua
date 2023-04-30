-- Zone: provinggrounds
-- NPC.: Projection_of_Body
--

local compass    = { zone="provinggrounds", x=1090.82, y=-4861.0, z=-309.726 }
local safereturn = { zone="provinggrounds", x=1094.75, y=-4879.25, z=-306.75, h=0 }
local zonein     = { x=0.0, y=-37.0, z=-0.875, h=0 }

local weaponry = {
	expedition = { name="Proving Grounds: The Mastery of Weaponry", min_players=2, max_players=6 },
	instance   = { zone="chambersb", version=1, duration=eq.seconds("1h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

local endurance = {
	expedition = { name="Proving Grounds: The Mastery of Endurance", min_players=6, max_players=54 },
	instance   = { zone="chambersb", version=2, duration=eq.seconds("3h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

function event_say(e)
	local dz = nil;
	if e.message:findi("hail") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Body says, 'Halt, " .. eq.get_race_name(e.other:GetRace()) .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Body, keeper of the trials of Weaponry and Endurance.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Weaponry") .. "] or [" .. eq.say_link("Endurance") .. "]?'")
	elseif e.message:findi("weaponry") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Body says, 'Mastery of a single armament of choice is not enough.  The time will come when the flexibility gained from proficiency in multiple weapon styles will turn the tide of a battle and the alternative is failure.  You must come to understand the value of weaponry.  If you have this ability, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(weaponry)

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("2h"));
		end
	elseif e.message:findi("endurance") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Body says, 'In a battle of attrition, an extended engagement, you must have the endurance to outlast your opposition.  When the defense is inpenetrable, your tenacity is more important than your offensive prowess.  If you have this ability, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(endurance);

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("3h"));
		end
	elseif e.message:findi('small') then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Body says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'")
	elseif e.message:findi("large") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Body says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")		
	end
end
