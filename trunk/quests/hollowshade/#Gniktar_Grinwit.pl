#Griming Leader in the North

sub EVENT_DEATH 
	{
	# leader is down - send signal after timer.
  	quest::ze(15,"The Grimling leader is dead, putting the Grimlings in the North in a panic!");
	quest::signalwith(166257, 2, 0);
	}

