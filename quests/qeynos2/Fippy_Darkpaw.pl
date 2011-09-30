sub EVENT_AGGRO {
   quest::say("You have trespassed long enough on Sabertooth land!");
}
   
sub EVENT_SPAWN {
      quest::shout("<BBBBBAAAARRRKKKK!!!!!> You humans will pay for ruining our homeland!! GRRRRRRRR!!!! Family Darkpaw of the Sabretooth Clan will slay you all!! <BARK!>");
	  quest::SetRunning(1)
}