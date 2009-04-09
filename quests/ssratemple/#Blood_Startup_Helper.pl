#Emporer Ssraeshza Event - This controller will handle situations where emp attempt failed.

sub EVENT_SIGNAL {
	if ($signal == 97) {   
		quest::settimer("fakebloodspawn", 10800);
	}
}

sub EVENT_TIMER {
   if ($timer eq "fakebloodspawn") {
      quest::spawn2(162064, 0, 0, 877.0, -327.0, 410.75, 193.0);
      quest::stoptimer("fakebloodspawn");
   }
}

#zone: ssratemple ID: 162203 NPC: #Blood_Startup_Helper
