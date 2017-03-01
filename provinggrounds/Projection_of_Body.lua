-- Zone: provinggrounds
-- NPC.: Projection_of_Body
--

function event_spawn(e)
  eq.set_proximity(e.self:GetX()+10, e.self:GetY()+10, e.self:GetX()-10, e.self:GetY()-10);
end

function event_enter(e)
    e.self:Say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!");
end

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'Halt, " .. e.other:GetCleanName() .. ", and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Body, keeper of the trials of Weaponry and Endurance. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [ " .. eq.say_link('small-scale') .. " ] or [large-scale] trials, or do you wish to enroll in [ " .. eq.say_link("Weaponry", false, "Weaponry") .. " ] or [ " .. eq.say_link('Endurance', false, 'Endurance') .. " ]?' ");

  elseif (e.message:findi("weaponry")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_weaponry', 'MPG: The Mastery of Weaponry' } } 
    local requests = instance_requests.ValidateRequest('group', 'chambersb', 1, 2, 6, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local instance_id = eq.create_instance('chambersb', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("'Mastery of a single armament of choice is not enough. The time will come when the flexibility gained from proficiency in multiple weapon styles will turn the tide of a battle and the alternative is failure. You must come to understand the value of weaponry. If you have this ability, now is the opportunity to prove your worth!'");
    end
    

  elseif (e.message:findi("endurance")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_endurance', 'MPG: Trial of Endurance' } }
    local requests = instance_requests.ValidateRequest('raid',  'chambresb', 2, 2, 54, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then 
      local instance_id = eq.create_instance('chambersb', 2, 10800);
      eq.assign_raid_to_instance(instance_id);

      e.self:Say("In a battle of attrition, an extended engagement, you must have the endurance to outlast your opposition. When the defense is inpenetrable, your tenacity is more important than your offensive prowess. If you have this ability, now is the oppurtunity to prove your worth.");
    end
  elseif (e.message:findi('small') ) then
    e.self:Say("'Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than six participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your [ ".. eq.say_link('progress') .. " ] will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.'");
  elseif (e.message:findi("progress")) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.Display_Group_Trials_Completed(e.other);
  end
end
