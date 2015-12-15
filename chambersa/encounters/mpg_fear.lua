local instance_id;
local mobs_died;
local mobs_must_die;
local minutes_remaining;
local lockout_name = 'MPG_fear';
local lockout_win = 72;
local lockout_loss = 2;

function Fear_Spawn(e)
  instance_id = eq.get_instance_id('chambersa', 1);
  eq.zone_emote(13, "instance_id: " .. instance_id);
  mobs_died = 0;
  mobs_must_die = 1;
  minutes_remaining = 1;
  player_list = eq.get_characters_in_instance(instance_id);

  eq.spawn_condition('chambersa', instance_id, 1, 0 );
  eq.spawn_condition('chambersa', instance_id, 2, 0 );
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

  elseif ( e.message:findi("end") ) then
    eq.spawn_condition('chambersa', instance_id, 2, 0 );
    eq.stop_all_timers();
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
          eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
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
  local box = require("aa_box");
  local dt_box = box(325, 105, -90, -58);
  local my_id = eq.get_instance_id("chambers", 1);
  eq.zone_emote(13, "tick my_id: " .. my_id);
  local my_list = eq.get_characters_in_instance(my_id);


  for k,v in pairs(my_list) do
    eq.zone_emote(13, "k: " .. k .. " v: " .. v);
    if (dt_box:contains(client:GetX(), client:GetY()) ) then
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
