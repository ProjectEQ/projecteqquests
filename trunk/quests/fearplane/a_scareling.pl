sub EVENT_SIGNAL
{
	if($signal == 0) 
	{
		quest::say("Such is the will of Cazic-Thule!");
	}
}

sub EVENT_DEATH_COMPLETE

{
	my $spawn = int(rand(100));
	if($spawn > 66) 
	{
		quest::spawn2(72108,0,0,$x,$y,$z,0);
	}
}


#Submitted by: Jim Mills
#add on sub EVENT_DEATH_COMPLETE for berserker epic spawn, 33% chance on death.