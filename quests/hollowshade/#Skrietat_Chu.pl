#Owlbear Leader in the North

sub EVENT_DEATH 
	{
	# leader is down - send signal after timer.
  	quest::ze(15,"The Owlbear leader is dead, putting the Owlbears in the North in a panic!");
	quest::signalwith(166257, 2, 0);
	}

