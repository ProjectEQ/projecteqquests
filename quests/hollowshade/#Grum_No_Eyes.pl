#Griming Leader in the East

sub EVENT_DEATH 
	{
	# leader is down - send signal after timer.
  	//quest::ze(15,"The Grimling leader is dead, putting the Grimlings in the East in a panic!");
	quest::signalwith(166257, 3, 0);
	}

