#Sonic Wolf Leader in the South

sub EVENT_DEATH 
	{
	# leader is down - send signal after timer.
  	//quest::ze(15,"The Sonic Wolf leader is dead, putting the Sonic Wolves in the South in a panic!");
	quest::signalwith(166257, 4, 0);
	}
