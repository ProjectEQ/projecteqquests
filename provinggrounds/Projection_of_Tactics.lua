-- Zone: provinggrounds
-- NCP.: Projection_Of_Tactics (316038)

local compass    = { zone="provinggrounds", x=-1576.28, y=-5567.32, z=-310.127 }
local safereturn = { zone="provinggrounds", x=-1577.75, y=-5561.125, z=-307.75, h=0 }
local zonein     = { x=0.0, y=-37.0, z=-0.875, h=0 }

local subversion = {
	expedition = { name="Proving Grounds: The Mastery of Subversion", min_players=2, max_players=6 },
	instance   = { zone="chambersc", version=1, duration=eq.seconds("1h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

local foresight = {
	expedition = { name="Proving Grounds: The Mastery of Foresight", min_players=6, max_players=54 },
	instance   = { zone="chambersc", version=2, duration=eq.seconds("3h") },
	compass    = compass,
	safereturn = safereturn,
	zonein     = zonein
}

function event_say(e)
	local dz = nil;
	if e.message:findi("hail") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Halt, " .. e.other:GetRaceName() .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Tactics, keeper of the trials of Subversion and Foresight.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Subversion") .. "] or [" .. eq.say_link("Foresight") .. "]?'")
	elseif e.message:findi("Subversion") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Knowing when to thwart your opponents using guile and subversion instead of brute force is critical to attaining true power.  Wealth can be amassed without ever unsheathing a blade.  The most ambitious rulers are overthrown not by their enemies on the battlefield, but by their 'allies' in the throne room.  If you understand my meaning, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(subversion);

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("2h"));
		end
	elseif e.message:findi("Foresight") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!'")
		dz = e.other:CreateExpedition(foresight);

		if dz.valid then
			dz:AddReplayLockout(eq.seconds("3h"));
		end
	elseif e.message:findi('small') then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'")
	elseif e.message:findi("large") then
		eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")
	end
end
