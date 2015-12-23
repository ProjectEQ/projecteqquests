-- Zone: provinggrounds
-- NPC.: Projection_of_Realms
--

function event_spawn(e)
  eq.set_proximity(e.self:GetX()+10, e.self:GetY()+10, e.self:GetX()-10, e.self:GetY()-10);
end

function event_enter(e)
    e.self:Say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!");
end

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'Halt, " .. e.other:GetCleanName() .. ", and hear my words. Your background and your status are of no consequence. All are welcome to participate in the trials to prove their worth, or die trying. Whosoever approaches me has addressed the embodiment of Realms, keeper of the trials of Ingenuity and Adaptation. The former is a small-scale test, while the latter is large-scale. My task is to explain the rules and usher hopefuls into the battle arena. Would you like to hear the rules for [small-scale] or [large-scale] trials, or do you wish to enroll in [" .. eq.say_link('Ingenuity', false, 'Ingenuity') .. "] or [Adaptation]?'");
  elseif (e.message:findi("ingenuity")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_ingenuity', 'MPG: The Mastery of Ingenuity' } } 
    local requests = instance_requests.ValidateGroupRequest('chamberse', 1, 2, 6, 65, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local instance_id = eq.create_instance('chamberse', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("'When faced with an insurmountable goal - an unbeatable adversary - do you accept defeat or can you identify the weaknesses that reverse the odds and secure a win in your favor? Do you have the ingenuity to see through to victory even when facing certain failure? If you have this ability, now is the opportunity to prove your worth!'");

    end
    

  elseif (e.message:findi("hatred")) then
    if (e.other:Admin() > 80) then 
      local instance_requests = require("instance_requests");
      local lockouts = { { 'MPG_hatred', 'MPG: Trial of Hatred' } }
      local requests = instance_requests.ValidateRaidRequest( 'chambresa', 2, 2, 54, 65, nil, e.other, lockouts);
      if (requests.valid and requests.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockouts);
      elseif (requests.valid and requests.flags == 0) then 
        local instance_id = eq.create_instance('chambersa', 2, 21600);
        eq.assign_raid_to_instance(instance_id);

        e.self:Say("Anger is a tool if you wield it correctly.  Invoking hatred in your enemies will provoke them into predictable and controllable behavior.  Can you harness your foes' hatred and twist it to your advantage?  If you have this ability, now is the opportunity to prove your worth!");
      end
    end
  end
end
