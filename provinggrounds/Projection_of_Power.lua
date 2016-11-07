-- Zone: provinggrounds
-- NPC.: Projection_of_Power
--

function event_spawn(e)
  eq.set_proximity(e.self:GetX()+10, e.self:GetY()+10, e.self:GetX()-10, e.self:GetY()-10);
end

function event_enter(e)
    e.self:Say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!");
end

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'Halt, " .. e.other:GetCleanName() .. ", and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Power, keeper of the trials of Destruction and Corruption. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [ " .. eq.say_link('small-scale', false, 'small-scale') .. " ] or [large-scale] trials, or do you wish to enroll in [ " .. eq.say_link('Destruction', false, 'Destruction') .. " ] or [Corruption]?' ");

  elseif (e.message:findi('small') ) then
    e.self:Say("'Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than six participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your progress will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.'");

  elseif (e.message:findi("destruction")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_destruction', 'MPG: The Mastery of Destruction' } } 
    local requests = instance_requests.ValidateRequest('group', 'chambersf', 1, 2, 6, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local instance_id = eq.create_instance('chambersf', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("'To conquer worlds requires the capability to annihilate vast areas. How much devastation can you inflict in as short a time as possible? Can you cut a swathe in the ranks of your enemy and destroy them with impunity? If you have this ability, now is the opportunity to prove your worth!'");
    end

  elseif (e.message:findi("hatred")) then
    if (e.other:Admin() > 80) then 
      local instance_requests = require("instance_requests");
      local lockouts = { { 'MPG_hatred', 'MPG: Trial of Hatred' } }
      local requests = instance_requests.ValidateRequest('raid',  'chambresa', 2, 2, 54, 65, nil, e.other, lockouts);
      if (requests.valid and requests.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockouts);
      elseif (requests.valid and requests.flags == 0) then 
        local instance_id = eq.create_instance('chambersa', 2, 21600);
        eq.assign_raid_to_instance(instance_id);

        e.other:Say("'While it can be admirable to defeat the opposition while in prime condition, a more accurate test of one's mettle is to tackle an opponent while fatigued and weary - yet still walk away victorious. If you have this ability, now is the opportunity to prove your worth!'");
      end
    end
  end
end
