-- Zone: provinggrounds
-- NPC.: Projection_of_Power
--

local compass = { "provinggrounds", -3053.37, -1030.69, 310.11 }
local safereturn = { "provinggrounds", -3057, -1042.375, -307.75, 0.0 }
local zonein = { 0.0, -37.0, -0.875, 0 }

local destruction = {
  info = { "Proving Grounds: The Mastery of Destruction", 2, 6 },
  dz = { "chambersf", 1, eq.seconds("1h"), compass = compass, safereturn = safereturn, zonein = zonein }
}

local corruption = {
  info = { "Proving Grounds: The Mastery of Corruption", 6, 54 },
  dz = { "chambersf", 2, eq.seconds("3h"), compass = compass, safereturn = safereturn, zonein = zonein }
}

function event_say(e)
  if (e.message:findi("hail")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Power says, 'Halt, " .. eq.get_race_name(e.other:GetRace()) .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Power, keeper of the trials of Destruction and Corruption.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [" .. eq.say_link("small-scale") .. "] or [" .. eq.say_link("large-scale") .. "] trials, or do you wish to enroll in [" .. eq.say_link("Destruction") .. "] or [" .. eq.say_link("Corruption") .. "]?'")
  elseif (e.message:findi("destruction")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Power says, 'To conquer worlds requires the capability to annihilate vast areas.  How much devastation can you inflict in as short a time as possible?  Can you cut a swathe in the ranks of your enemy and destroy them with impunity?  If you have this ability, now is the opportunity to prove your worth!'")
    e.other:CreateExpedition(destruction.dz, destruction.info)
  elseif (e.message:findi("corruption")) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Power says, 'Prepare yourself for the greatest challenge of all.  The Mastery of Corruption will test your battle prowess as well as your strength of character.  Can you see through corruption and rout it out, or are you corrupt yourself?  The spoils of war include the chance to rewrite history.  The victor will decide who was right and who was wrong, but in the end - do such things even matter?'")
    e.other:CreateExpedition(corruption.dz, corruption.info)
  elseif (e.message:findi('small') ) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Power says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than six participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be carefully monitored.  If you take too long, you will fail.  These are the rules and they are not negotiable.'")
  elseif e.message:findi("large") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Projection of Power says, 'Every test has its rules and these trials are no exception.  The following guidelines must be followed to the letter, or else you stand to forfeit or perish.  You are allowed no more than fifty-four participants in the battle.  Once the trial has begun, you must remain in the combat area.  Violators of this rule will be warned and then destroyed.  Your progress will be monitored.  The longer you tarry in completing your task, the more difficult your task will become.  These are the rules and they are not negotiable.'")
  elseif (e.message:findi("progress")) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.Display_Completed_Trials(e.other);
  end
end
