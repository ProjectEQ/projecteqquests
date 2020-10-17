-- Zone: provinggrounds
-- NPC.: Projection_of_Realms
--

local compass    = { zone="provinggrounds", x=-2098.05, y=-4342.75, z=-310.127 }
local safereturn = { zone="provinggrounds", x=-2092.0, y=-4346.625, z=-307.75, h=0 }
local zonein     = { x=0.0, y=-37.0, z=-0.875, h=0 }

local ingenuity = {
  expedition = { name="Proving Grounds: The Mastery of Ingenuity", min_players=2, max_players=6 },
  instance   = { zone="chamberse", version=1, duration=eq.seconds("1h") },
  compass    = compass,
  safereturn = safereturn,
  zonein     = zonein
}

local adaptation = {
  expedition = { name="Proving Grounds: The Mastery of Adaptation", min_players=6, max_players=54 },
  instance   = { zone="chamberse", version=2, duration=eq.seconds("3h") },
  compass    = compass,
  safereturn = safereturn,
  zonein     = zonein
}

function event_say(e)
  if (e.message:findi("hail")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Realms says, 'Halt, " .. eq.get_race_name(e.other:GetRace()) .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Realms, keeper of the trials of Ingenuity and Adaptation.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Ingenuity") .. "] or [" .. eq.say_link("Adaptation") .. "]?'")
  elseif (e.message:findi("ingenuity")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Realms says, 'When faced with an insurmountable goal - an unbeatable adversary - do you accept defeat or can you identify the weaknesses that reverse the odds and secure a win in your favor?  Do you have the ingenuity to see through to victory even when facing certain failure?  If you have this ability, now is the opportunity to prove your worth!'")
    e.other:CreateExpedition(ingenuity)
  elseif (e.message:findi("adaptation")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Realms says, 'Can you modify your strategy in the heat of battle?  In an unpredictable and chaotic environment will you be able to adapt quickly to whatever adversities you face?  If you have this ability, now is the opportunity to prove your worth!'")
    e.other:CreateExpedition(adaptation)
  elseif (e.message:findi('small') ) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Realms says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'");
  elseif e.message:findi("large") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Tactics says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")
  elseif (e.message:findi("progress")) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.Display_Completed_Trials(e.other);
  end
end
