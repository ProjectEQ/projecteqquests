#Sonic Wolf Leader in the East

sub EVENT_DEATH_COMPLETE 
	{
	# leader is down - send signal after timer.
  	//quest::ze(15,"The Sonic Wolf leader is dead, putting the Sonic Wolves in the East in a panic!");
	quest::signalwith(166257, 3, 0);
	}

