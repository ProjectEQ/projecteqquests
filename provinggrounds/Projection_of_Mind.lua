-- Zone: provinggrounds
-- NCP.: Projection_of_Mind
--

function event_spawn(e)
  eq.set_proximity(e.self:GetX()+10, e.self:GetY()+10, e.self:GetX()-10, e.self:GetY()-10);
end

function event_enter(e)
    e.self:Say("Perception and split-second reactions are not something you can acquire in training.  It's a gift learned on the battlefield, and the penalty for being a slow learner is a quick and decisive death.  Can you see the arrow as it sails toward your heart and sidestep out of the way?  If you have this ability, now is the opportunity to prove your worth!");
end

function event_say(e)
  if (e.message:findi("hail")) then
    e.self:Say("Halt, " .. e.other:GetCleanName() .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Mind, keeper of the trials of Fear and Hatred.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [small-scale] or [large-scale] trials, or do you wish to enroll in [" .. eq.say_link( 'fear', false, 'Fear') .. "] or [" .. eq.say_link('hatred', false, 'Hatred') .. "]?");

  elseif (e.message:findi("fear")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_fear', 'MPG: The Mastery of Fear' } } 
    local requests = instance_requests.ValidateGroupRequest('chambersa', 1, 2, 6, 65, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local instance_id = eq.create_instance('chambersa', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("Fear is power.  An opponent whose resolve has been broken has already been defeated.  You must learn to invoke terror in the hearts of your enemies and destroy them as they cower in weakness.  If you have this ability, now is the opportunity to prove your worth!");
    end
    

  elseif (e.message:findi("hatred")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_hatred', 'MPG: Trial of Hatred' } }
    local requests = instance_requests.ValidateRaidRequest( 'chambersa', 2, 2, 54, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then 
      local instance_id = eq.create_instance('chambersa', 2, 21600);
      eq.assign_raid_to_instance(instance_id);

      e.self:Say("Anger is a tool if you wield it correctly.  Invoking hatred in your enemies will provoke them into predictable and controllable behavior.  Can you harness your foes' hatred and twist it to your advantage?  If you have this ability, now is the opportunity to prove your worth!");

      eq.cross_zone_message_player_by_name(5, "GMFizban", "Mastery of Hatred -- Instance: " .. instance_id);
    end
  end
end
