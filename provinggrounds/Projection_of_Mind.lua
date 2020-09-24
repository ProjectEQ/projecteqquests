-- Zone: provinggrounds
-- NCP.: Projection_of_Mind
--
local compass = { "provinggrounds", -930.948, 390.328, -309.377 }
local safereturn = { "provinggrounds", -942.625, 400.5, -307.25, 0.0 }
local zonein = { 0.0, -37.0, -0.875, 0 }

local fear = {
  info = { "Proving Grounds: The Mastery of Fear", 2, 6 },
  dz = { "chambersa", 1, eq.seconds("1h"), compass = compass, safereturn = safereturn, zonein = zonein }
}

local hatred = {
  info = { "Proving Grounds: The Mastery of Hatred", 6, 54 },
  dz = { "chambersa", 2, eq.seconds("3h"), compass = compass, safereturn = safereturn, zonein = zonein }
}

function event_say(e)
  if (e.message:findi("hail")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Mind says, 'Halt, " .. eq.get_race_name(e.other:GetRace()) .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Mind, keeper of the trials of Fear and Hatred.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Fear") .. "] or [" .. eq.say_link("Hatred") .. "]?'")
  elseif (e.message:findi("fear")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Mind says, 'Fear is power.  An opponent whose resolve has been broken has already been defeated.  You must learn to invoke terror in the hearts of your enemies and destroy them as they cower in weakness.  If you have this ability, now is the opportunity to prove your worth!'")
    e.other:CreateExpedition(fear.dz, fear.info)
  elseif (e.message:findi("hatred")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Mind says, 'Anger is a tool if you wield it correctly.  Invoking hatred in your enemies will provoke them into predictable and controllable behavior.  Can you harness your foes' hatred and twist it to your advantage?  If you have this ability, now is the opportunity to prove your worth!'")
    e.other:CreateExpedition(hatred.dz, hatred.info)
  elseif (e.message:findi('small') ) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Mind says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'")
  elseif e.message:findi("large") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Mind says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")
  elseif (e.message:findi("progress")) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.Display_Completed_Trials(e.other);
  end
end
