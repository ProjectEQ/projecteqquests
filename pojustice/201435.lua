-- 201435 Trial of Lashing
-- Trial of Lashing
--

local lashing_flag      = 0;
local trail_group       = nil;
local trial_count       = nil;
local client_e          = nil;
local trial_x           = 1373;
local trial_y           = -1125;
local trial_z           = 1;
local trial_h           = 60;
local trial_mobs			= { 201463, 201464, 201465, 201466, 201467, 201468, 201469 };

local cooldown_timer		= 1800000;
local eject_timer			= 900000;
local fail_timer			= 360000;

function event_say(e)
   local qglobals = eq.get_qglobals(e.self,e.other);

   if (qglobals["pop_poj_mavuin"] ~= nil) then 
      if (e.message:findi("hail")) then 
         e.self:Emote(" fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [" .. eq.say_link( "prepared", false, "prepared") .. "]?");

      elseif (e.message:findi("prepared")) then
         e.self:Say("Very well. When you are ready, you may [" .. eq.say_link("ready to begin the trial of lashing", false, "begin the trial of lashing") .. "]. You must protect the victims from their tormentors. Be wary of the scourge of honor - you cannot fight it directly. You must find and destroy its life force to defeat it. We shall judge the mark of your success.");
         
      elseif (e.message:findi("ready to begin the trial of lashing")) then
         if ( lashing_flag == 0 ) then 
            e.self:Say("Then begin.");

            -- Move the Player and their Group tot he trial room.
            trial_group = e.other:GetGroup();
            if ( trial_group.valid ) then
               MoveGroup( trial_group, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, trial_x, trial_y, trial_z, trial_h); 
            else
               client_e = e;
               e.other:MovePC(201, trial_x, trial_y, trial_z, trial_h);
            end

            -- Spawn the Controller
            eq.spawn2(201449, 0, 0, trial_x, trial_y, trial_z, trial_h);

            -- Set the Proximity Check Timer; if everyone has left the trial (wipe); then reset things
            eq.set_timer("proximitycheck", 60000);

            -- Set a variable to indicate the Trial is unavailable.
            lashing_flag = 1;
         else
            e.self:Say("I'm sorry, the Trial of Lashing is currently unavilable to you.");
         end
      elseif (e.message:findi("what evidence of mavuin") ) then
         if ( e.other:HasItem(31960) ) then
            eq.set_global("pop_poj_tribunal", "1", 5, "F");
            eq.set_global("pop_poj_lashing", "1", 5, "F");
            e.other:Message(4, "You receive a character flag!");
         end
		elseif (e.message:findi("i seek knowledge") ) then
			local marks = { 31796, 31842, 31844, 31845, 31846 , 31960 }
			local has_six = 1;
			for k,v in pairs(marks) do
				if (not e.other:HasItem(v)) then
					has_six = 0;
				end
			end

			if (has_six == 1) then 
				if (not e.other:HasItem(31599)) then 
					-- give 31599 to e.other
					e.other:SummonItem(31599);
				end
			elseif (has_six == 0) then
				e.self:Say("You have done well, mortal, but there are more trials yet for you to complete.");
			end
      end
   end
end

function event_timer(e)

   if (e.timer == "ejecttimer") then

      eq.stop_timer(e.timer);
      despawn_trial_mobs()

      if (trial_group ~= nil and trial_group.valid) then
         MoveGroup( trial_group, trial_x, trial_y, trial_z, 250, 456, 825, 9, 180, "A mysterious force translocates you."); 
      else
         client_e.other:MovePC( 201, 456, 825, 9, 180 );
			client_e.other:Message( 3, "A mysterious force translocates you.");
      end
      HandleCorpses(trial_x, trial_y, trial_z, 200);

      eq.stop_timer("proximitycheck");

   elseif (e.timer == "cooldown") then
      
      eq.stop_timer(e.timer);

      lashing_flag   = 0;
      client_e         = nil;
      trial_group      = nil;
      trial_count      = nil;

      despawn_trial_mobs();

      eq.stop_timer("proximitycheck");
      e.self:Shout("The Trial of Lashing is now Available.");

   elseif (e.timer == "proximitycheck") then
      -- The proximitycheck timer is primarily for when a trial has failed
      -- This check will allow the trial to be re-attempted as soon as
      -- everyone has left the trial room (or they are kicked out after
      -- 15minutes by the ejecttimer).

      -- Check to see if all the PCs have left the Trial area; if so
      -- Clean Corpses up and release thoe hold and stop the timer.
      if ( ProximityCheck(trial_x, trial_y, trial_z, 250) == false) then 
         eq.stop_timer(e.timer);

         eq.stop_timer("cooldown");
         eq.stop_timer("ejecttimer");
         eq.set_timer("ejecttimer", 100);
         eq.set_timer("cooldown", 200);
      end
   end
end

function event_signal(e)
   -- 
   if (e.signal == 0) then
      
   elseif (e.signal == 1) then
      -- Trial was successful
      -- 30min till next Trial can start
      -- 15min Eject Timer to kick any PC out of the Trial Room
      eq.set_timer("ejecttimer", eject_timer);
      eq.set_timer("cooldown"  , cooldown_timer);

		eq.stop_timer("proximitycheck");

   elseif (e.signal == 2) then
      -- Trial Failed
      eq.set_timer("ejecttimer", fail_timer);
      eq.set_timer("cooldown"  , fail_timer);

      eq.stop_timer("proximitycheck");
      eq.set_timer("proximitycheck", 10000);

   end

end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h, msg)
   if ( trial_group ~= nil) then
      local trial_count = trial_group:GroupCount();

      for i = 0, trial_count - 1, 1 do
         local client_v = trial_group:GetMember(i):CastToClient();

         if (client_v.valid) then
            -- check the distance and port them up if close enough
            if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
               -- port the player up
               client_v:MovePC(201, tgt_x, tgt_y, tgt_z, tgt_h);

					if (msg) then
						client_v:Message(3, msg);
					end
            end
         end
      end
   end
end

function HandleCorpses(src_x, src_y, src_z, dist)

   -- Move Player Corpses from the Trial Area to the Grave Yard
   local clist = eq.get_entity_list():GetCorpseList();
   if ( clist ~= nil ) then
      for corpse in clist.entries do
         if ( corpse:IsPlayerCorpse() ) then
             if (corpse:CalculateDistance(src_x, src_y, src_z) < dist) then
               corpse:GMMove(58, -47, 2);      
             end
         elseif ( corpse:IsNPCCorpse() ) then
            if (corpse:CalculateDistance(src_x, src_y, src_z) < dist) then
               corpse:Delete();
            end
          end
      end
   end
end

function ProximityCheck(chk_x, chk_y, chk_z, dist)

   local players_in_prox = false;
   local clist = eq.get_entity_list():GetClientList();

   if ( clist ~= nil ) then
      for client in clist.entries do
         if (client:CalculateDistance(chk_x, chk_y, chk_z) < dist) then
            players_in_prox = true;
         end
      end
   end

   return players_in_prox;
end

function despawn_trial_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end
