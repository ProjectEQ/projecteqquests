function event_signal(e)
   -- get quest globals
   local qglobals = eq.get_qglobals();

   if (qglobals["ixt_br"] and qglobals["ikaav_br"] and qglobals["frenetic_br"] ) then
     eq.spawn2(336134, 0, 0, 1678,2778,-24.97,130.5);
   end
end 
