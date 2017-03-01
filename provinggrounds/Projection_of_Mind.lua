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
    e.self:Say("Halt, " .. e.other:GetCleanName() .. ", and hear my words.  Your background and your status are of no consequence.  All are welcome to participate in the trials to prove their worth, or die trying.  Whosoever approaches me has addressed the embodiment of Mind, keeper of the trials of Fear and Hatred.  The former is a small-scale test, while the latter is large-scale.  My task is to explain the rules and usher hopefuls into the battle arena.  Would you like to hear the rules for [ " .. eq.say_link('small-scale') .. " ] or [large-scale] trials, or do you wish to enroll in [" .. eq.say_link( 'fear', false, 'Fear') .. "] or [" .. eq.say_link('hatred', false, 'Hatred') .. "]?");

  elseif (e.message:findi("fear")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_fear', 'MPG: The Mastery of Fear' } } 
    local requests = instance_requests.ValidateRequest('group', 'chambersa', 1, 2, 6, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then
      local mpg = require("mpg_helper");
      local instance_id = eq.create_instance('chambersa', 1, 3600);
      eq.assign_group_to_instance(instance_id);

      e.self:Say("Fear is power.  An opponent whose resolve has been broken has already been defeated.  You must learn to invoke terror in the hearts of your enemies and destroy them as they cower in weakness.  If you have this ability, now is the opportunity to prove your worth!");

      mpg.SetLockoutTime(instance_id, lockouts[1][1], 1); 
    end
  elseif (e.message:findi("hatred")) then
    local instance_requests = require("instance_requests");
    local lockouts = { { 'MPG_hatred', 'MPG: Trial of Hatred' } }
    local requests = instance_requests.ValidateRequest('raid',  'chambersa', 2, 2, 54, 65, nil, e.other, lockouts);
    if (requests.valid and requests.flags == 1) then
      instance_requests.DisplayLockouts(e.other, e.other, lockouts);
    elseif (requests.valid and requests.flags == 0) then 
      local instance_id = eq.create_instance('chambersa', 2, 10800);
      eq.assign_raid_to_instance(instance_id);

      e.self:Say("Anger is a tool if you wield it correctly.  Invoking hatred in your enemies will provoke them into predictable and controllable behavior.  Can you harness your foes' hatred and twist it to your advantage?  If you have this ability, now is the opportunity to prove your worth!");

      mpg.SetLockoutTime(instance_id, lockouts[1][1], 3); 
      eq.cross_zone_message_player_by_name(5, "GMFizban", "Mastery of Hatred -- Instance: " .. instance_id);
    end
--   elseif (e.message:findi("remove")) then
--     local instance_id = eq.get_instance_id('chambersa', 1);
--     if ( instance_id ~= nil and instance_id ~= 0 ) then
--       eq.remove_from_instance(instance_id);
--     else
--       instance_id = eq.get_instance_id('chambersa', 2);
--       eq.remove_from_instance(instance_id);
--     end
  elseif (e.message:findi('small') ) then
    e.self:Say("'Every test has its rules and these trials are no exception. The following guidelines must be followed to the letter, or else you stand to forfeit or perish. You are allowed no more than six participants in the battle. Once the trial has begun, you must remain in the combat area. Violators of this rule will be warned and then destroyed. Your [ ".. eq.say_link('progress') .. " ] will be carefully monitored. If you take too long, you will fail. These are the rules and they are not negotiable.'");
  elseif (e.message:findi("progress")) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.Display_Group_Trials_Completed(e.other);
  end
end
