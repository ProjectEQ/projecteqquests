-- Zone: provinggrounds
-- NPC.: Projection_of_Arcana
--

function event_spawn(e)
  eq.set_proximity(e.self:GetX()+10, e.self:GetY()+10, e.self:GetX()-10, e.self:GetY()-10);
end

function event_enter(e)
    e.self:Say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!");
end

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'Halt, " .. e.other:GetCleanName() .. ", and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Arcana, keeper of the trials of Efficiency and Specialization. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [ " .. eq.say_link("small-scale", false, "small-scale") .. " ] or [large-scale] trials, or do you wish to enroll in [ " .. eq.say_link('Efficiency', false, 'Efficiency') .." ] or [ " .. eq.say_link('Specialization', false, 'Specialization') .. " ]?'");

  elseif (e.message:findi('small-scale') ) then
    e.self:Say("'Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than six participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your progress will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.'");

  elseif (e.message:findi("efficiency")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_efficency', 'MPG: The Mastery of Weaponry' } } 
    local requests = instance_requests.ValidateRequest('group', 'chambersd', 1, 2, 6, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local instance_id = eq.create_instance('chambersd', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("'Mastery of a single armament of choice is not enough. The time will come when the flexibility gained from proficiency in multiple weapon styles will turn the tide of a battle and the alternative is failure. You must come to understand the value of efficency. If you have this ability, now is the opportunity to prove your worth!'");
    end

  elseif (e.message:findi("specialization")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_specialization', 'MPG: Trial of Specialization' } }
    local requests = instance_requests.ValidateRequest('raid',  'chambersd', 2, 2, 54, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then 
      local instance_id = eq.create_instance('chambersd', 2, 10800);
      eq.assign_raid_to_instance(instance_id);

      e.self:Say("At times it pays to be focused in your abilities, and at times it does not. This trial will test your skill at using your strengths when they are most effective, and otherwise relying on your companions. If you have this ability now is the time to prove your worth.");

      eq.cross_zone_message_player_by_name(5, "GMFizban", "Mastery of Specialization -- Instance: " .. instance_id);
    end
  end
end
