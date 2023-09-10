--south jailer npc in ZMTZ banish script
function ProximityCheck(chk_x, chk_y, chk_z, dist)

   local players_in_prox = false;
   local clist = eq.get_entity_list():GetClientList();

   if ( clist ~= nil ) then
      for client in clist.entries do
         if (client:CalculateDistance(chk_x, chk_y, chk_z) < dist) then
            if (client:GetY() < -175) then
               players_in_prox = true;
            end
         end
      end
   end

   return players_in_prox;
end

function event_spawn(e)
   eq.set_timer("emoteone", 10 * 1000);
end

function event_timer(e)
   if (e.timer == "emoteone") then
      eq.stop_timer("emoteone");
      eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.Yellow, 50,"Faint whispers can be heard all around you.");
      eq.set_timer("emotetwo", 5 * 1000);
   elseif (e.timer == "emotetwo") then
      eq.stop_timer("emotetwo");
      eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.Yellow, 50,"An unearthly moan echoes through the small room.");
      eq.set_timer("emotethree", 5 * 1000);
   elseif (e.timer == "emotethree") then
      eq.stop_timer("emotethree");
      if ProximityCheck(1454, -213, -328, 80) then --south jail
         eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.Yellow, 50,"Angered by your presence here, apparitions step through the nearby walls. A bone chilling cold fills the room as they reach for your throat.");
         eq.spawn2(297152,0,0,1500, -180, -328, 396)
         eq.spawn2(297152,0,0,1500, -234, -328, 460)
         eq.spawn2(297152,0,0,1469, -236, -328, 510)
         eq.spawn2(297152,0,0,1449, -235, -328, 510)
         eq.spawn2(297152,0,0,1413, -234, -328, 72)
         eq.spawn2(297152,0,0,1412, -207, -328, 134)
         eq.set_timer("check", 60 * 1000); -- check every 60 sec if people in room
      else
         eq.depop();
      end
   elseif (e.timer == "check") then
      if not ProximityCheck(1454, -213, -328, 80) then --stay up until area is cleared
         eq.depop_all(297152); --a_vengeful_apparition (297152)
         eq.depop();
      end
   end
end
