local instance_id;
local mobs_died;
local mobs_must_die;
local minutes_remaining;
local lockout_name = 'MPG_fear';
local lockout_win = 72;
local lockout_loss = 2;
local warnings = 0;
local aa_grant_list;

function Fear_Spawn(e)
  --instance_id = eq.get_instance_id('chambersa', 1);
  instance_id = eq.get_zone_instance_id();
  mobs_died = 0;
  mobs_must_die = 15;
  minutes_remaining = 15;
  player_list = eq.get_characters_in_instance(instance_id);

  eq.spawn_condition('chambersa', instance_id, 1, 1 );
  eq.spawn_condition('chambersa', instance_id, 2, 0 );

end

function grant_aa()
  -- global: mpg_aas_granted
end

function Fear_Say(e)
  instance_id = eq.get_instance_id('chambersa', 1);
  if ( e.message:findi("hail") ) then
    e.self:Say("This is the Mastery of Fear trial.  You must demonstrate your ability to inflict terror in the hearts of your enemies, and defend yourself when this tactic fails.  Are you ready to [begin]?");
  elseif ( e.message:findi("begin") ) then
    eq.spawn_condition('chambersa', instance_id, 2, 1 );

    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");

  elseif ( e.other:Admin() > 80 ) then
    if ( e.message:findi("end") ) then
      eq.spawn_condition('chambersa', instance_id, 2, 0 );
      eq.stop_all_timers();
    elseif ( e.message:findi("aa0") ) then 
      e.other:GrantAlternateAdvancementAbility(466, 0);
    elseif ( e.message:findi("aa1") ) then 
      e.other:GrantAlternateAdvancementAbility(466, 1);
    elseif ( e.message:findi("aa2") ) then 
      e.other:GrantAlternateAdvancementAbility(466, 2);
    elseif ( e.message:findi("aa3") ) then 
      e.other:GrantAlternateAdvancementAbility(466, 3);
    elseif ( e.message:findi("aa4") ) then 
      e.other:GrantAlternateAdvancementAbility(466, 4);
    elseif ( e.message:findi("aa5") ) then 
      e.other:GrantAlternateAdvancementAbility(566, 4);
    elseif ( e.message:findi("aas") ) then
      local player_list = eq.get_characters_in_instance(instance_id);
        for k,v in pairs(player_list) do
        end
    end
  end
end

function Fear_Signal(e)
  mobs_died = mobs_died + 1;
end

function Fear_Timer(e)
  if (e.timer == 'minutes') then
    minutes_remaining = minutes_remaining - 1;
    
    if (minutes_remaining == 0) then
      local instance_requests = require("instance_requests");
      local player_list = eq.get_characters_in_instance(instance_id);
      
      eq.stop_timer('minutes');
      eq.spawn_condition('chambersa', instance_id, 1, 0 );
      eq.spawn_condition('chambersa', instance_id, 2, 0 );

      if (mobs_died >= mobs_must_die) then
        eq.zone_emote(15, "The understanding you have gained by completing one of Mata Muram's trials has increased your maximum resistances.");

        eq.spawn2(304013, 0, 0, -212, 273, 71, 20);
        eq.depop();

        for k,v in pairs(player_list) do
          -- Set a 72 hour lockout on a Win.
          eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);

          local this_bit = 1;
          local client = eq.get_entity_list():GetClientByCharID(v);
          local client_globals = eq.get_qglobals(client);

          -- Get the number of MPG Trials complete; There are a max of 4 AAs to award.
          local mpg_group_aas_granted = tonumber(client_globals["mpg_group_aas_granted"]);
          if ( mpg_group_aas_granted == nil ) then mpg_group_aas_granted = 0; end
          
          -- Get the bits of the MPG Trials completed; we should only award an AA the first time 
          -- a Character complets a trial.
          local mpg_group_trials = tonumber(client_globals["mpg_group_trials"]);
          if ( mpg_group_trials == nil ) then mpg_group_trials = 0; end
          
          local has_done_this_trial; 
          if (bit.band(mpg_group_trials, this_bit) == 0) then
            has_done_this_trial = false;
          else
            has_done_this_trial = true;
          end

          -- Has character maxed out the Trials of Mata Muram (4) 
          -- Has character done this trial before?
          if ( mpg_group_aas_granted >= 0 and mpg_group_aas_granted < 4 and has_done_this_trial == false ) then
            mpg_group_aas_granted = mpg_group_aas_granted + 1;
            eq.target_global("mpg_group_aas_granted", tostring(mpg_group_aas_granted), "F", 0, v, 0);
            eq.target_global("mpg_group_trials", tostring(bit.bor(mpg_group_trials, this_bit)), "F", 0, v, 0);
            e.other:GrantAlternateAdvancementAbility(466, mpg_group_aas_granted);
          end
        end
        
      else
        eq.zone_emote(13, "You have been found unworthy, perhapse you are not as frightful as you thought you might be.");
        eq.depop();

        for k,v in pairs(player_list) do
          eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(2)), "H2", 0, v, 0);
        end
      end
    else 
      eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
    end
  end
end

function Fearless_Died(e)
  eq.signal(304004, 1);
end

function Fearable_Tick(e)
  local hp = e.self:GetMaxHP() * .20;
  if (e.self:IsFeared()) then
    if ( (e.self:GetHP() - hp ) > 0 ) then 
      e.self:SetHP( e.self:GetHP() - hp );
    else
      eq.depop_with_timer();
    end
  end
end

function Deathtouch_Tick(e)
  local my_id = eq.get_zone_instance_id();
  local my_list = eq.get_characters_in_instance(my_id);

  for k,v in pairs(my_list) do
    local client = eq.get_entity_list():GetClientByCharID(v);
    if (client.valid) then 
      if (client:GetX() > -64 or client:GetY() < 122 ) then
        client:Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials. Return to the arena or be subjected to pain.'");
        if ( warnings >= 10 ) then
          client:Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
          if (client:Admin() < 80) then 
            client:Kill();
          end
        else 
          warnings = warnings + 1;
        end
      end
    end

  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_fear', Event.tick, 304006, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304007, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304008, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304009, Fearable_Tick);

  eq.register_npc_event('mpg_fear', Event.death_complete, 304005, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304010, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304011, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304012, Fearless_Died);

  eq.register_npc_event('mpg_fear', Event.spawn,          304004, Fear_Spawn);
  eq.register_npc_event('mpg_fear', Event.say,            304004, Fear_Say);
  eq.register_npc_event('mpg_fear', Event.signal,         304004, Fear_Signal);
  eq.register_npc_event('mpg_fear', Event.timer,          304004, Fear_Timer);

  eq.register_npc_event('mpg_fear', Event.tick, 304021, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
