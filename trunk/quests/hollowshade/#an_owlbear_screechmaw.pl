#owlbear Leader in the South

sub EVENT_HAIL
	{
  	quest::ze(15,"The Southern Owlbear leader is dead, putting the Owlbears in the South in a panic!");
	}
sub EVENT_DEATH 
	{
	# leader is down - send signal after timer.
  	quest::ze(15,"The Owlbear leader is dead, putting the Owlbears in the South in a panic!");
	quest::signalwith(166257, 4, 0);
	}
