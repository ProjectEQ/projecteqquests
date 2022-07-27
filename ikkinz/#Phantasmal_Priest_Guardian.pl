#     #Phantasmal_Priest_Guardian.pl
#     294611
# items: 60246
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60246 =>1 )) {
	 if ($qglobals{$instanceid.ikkymove} == 1) {
		quest::setglobal($instanceid.ikkymove,2,5,"H6");
		quest::ze(0,"The guardian stirs slightly before settling down.");
	 }
	 elsif ($qglobals{$instanceid.ikkymove} == 2) {
		quest::signalwith(294609,2,0); # NPC: #Phantasmal_Priest
		quest::signalwith(294609,1,0); # NPC: #Phantasmal_Priest
		quest::ze(0,"The two guardians come alive as the priest 

disperses! Your attempt at commanding them has failed!");
	 }
   }
  plugin::return_items(\%itemcount);
}


#function event_trade(e)
#	local item_lib = require("items");
#	local qglobals = eq.get_qglobals();
#	local instance_id = eq.get_zone_instance_id();
#	if(item_lib.check_turn_in(e.trade, {item1 = 60246}))  then
#		if (qglobals[instance_id .. "ikkymove"] ==1) then
#		eq.set_global(instance_id .. "ikkymove","2",5,"H6");
#		eq.zone_emote(0, "The guardian stirs slightly before settling down.")
#		elseif (qglobals[instance_id .. "ikkymove"] ==2) then
#		eq.zone_emote(0, "The two guardians come alive as the priest disperses! Your attempt at commanding them has failed!")
#		eq.signal(294609,2); -- NPC: #Phantasmal_Priest
#		eq.signal(294609,1); -- NPC: #Phantasmal_Priest
#		end
#	end
#	item_lib.return_items(e.self, e.other, e.trade)
#end
