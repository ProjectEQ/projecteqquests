-- 201449 #Event_Lashing_Control
-- Trial of Lashing Controller
--
--
local trial_wave      = 0;

-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local wave_timer      = 90000;
local first_wave      = 20000;

local trial_mobs	= { 201463, 201464, 201465, 201466, 201467, 201468, 201469 };

local wave_mobs	= { 201464, 201465, 201466, 201470 };

function event_spawn(e)
   spawn_prisoners();

   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);

   trial_wave = 0;

end

function event_signal(e)
   if (e.signal == 1) then
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");

      eq.signal(201435, 1);

      despawn_mobs();
      eq.depop();

   elseif (e.signal == 2) then
      -- Failed
      eq.get_entity_list():MessageClose(e.self, false, 120, 3, "An unnatural silence falls around you.  The justice of the Tribunal has been pronounced once again.  The defendants have been found... lacking.");

      despawn_prisoners();
      eq.signal(201435, 2);

		-- Depop the Scourge of Honor as they are immune to damage and despawned
		-- by the controller we are about to depop.
		eq.depop_all(201467);
      eq.depop();

   elseif (e.signal == 9) then 
      -- A Flickering Spirit has died; if all three are dead
      -- despawn a scourge of honor
      if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(201469) == false ) then
         eq.depop_all( 201467 );

         if (trial_wave < 4) then 
            eq.set_timer("next_wave", 60000);
         elseif(trial_wave == 4) then
            eq.set_timer("next_wave", 1000);
         end
      end

   end

end

function event_timer(e)

   if (e.timer == "next_wave") then
      eq.stop_timer(e.timer);

      trial_wave = trial_wave + 1;
      spawn_mobs(trial_wave);

   elseif (e.timer == "spirit_timer") then
      eq.stop_timer(e.timer);

      spawn_spirits();

   end
end

function spawn_spirits()
   eq.spawn2( 201469, 0, 0, 1298, -1169, -13, 63 );
   eq.spawn2( 201469, 0, 0, 1153, -1119,  88, 63 );
   eq.spawn2( 201469, 0, 0, 1298, -1072, -13, 63 );

   eq.spawn2( 201467, 0, 0, 1350, -1127, 2, 62);
end

function spawn_mobs(wave)

   if (wave < 5) then
      eq.spawn2( eq.ChooseRandom( 201464, 201465, 201466, 201470 ), 0, 0, 1395, -1169, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201464, 201465, 201466, 201470 ), 0, 0, 1378, -1169, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201464, 201465, 201466, 201470 ), 0, 0, 1395, -1070, 1, 64 );
      eq.spawn2( eq.ChooseRandom( 201464, 201465, 201466, 201470 ), 0, 0, 1378, -1070, 1, 64 );
      
      eq.set_timer("spirit_timer", 30000);

   elseif (wave == 5) then
      -- Spawn the boss
      eq.spawn2(201468, 0,0, 1350, -1127, 2, 62);
   end
end

function spawn_prisoners()
   -- a tortured prisoner
   eq.spawn2(201463, 0, 0, 1417, -1168, 1, 196);
   eq.spawn2(201463, 0, 0, 1417, -1120, 1, 196);
   eq.spawn2(201463, 0, 0, 1417, -1072, 1, 196);
end

function despawn_prisoners() 
   local prisoners = { 201463 }
   for k,v in pairs(prisoners) do
      eq.depop_all(v);
   end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end

