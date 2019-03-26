#     #Phantasmal_Priest_Guardian.pl
#     294611
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60246 =>1 )) {
	 if ($qglobals{$instanceid.ikkymove} == 1) {
		quest::setglobal($instanceid.ikkymove,2,5,"H6");
		quest::ze(0,"The guardian stirs slightly before settling down.");
	 }
	 elsif ($qglobals{$instanceid.ikkymove} == 2) {
		quest::signalwith(294609,2,0); # NPC: #Phantasmal_Priest
		quest::signalwith(294609,1,0); # NPC: #Phantasmal_Priest
		quest::ze(0,"The two guardians come alive as the priest disperses! Your attempt at commanding them has failed!");
	 }
   }
  plugin::return_items(\%itemcount);
}