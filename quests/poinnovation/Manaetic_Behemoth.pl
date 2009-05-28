my $spawn = 0;

sub EVENT_SPAWN {

	quest::settimer(7,120);
	}

sub EVENT_SIGNAL {

if($signal == 1)
	{
	$spawn=$spawn += 1;
	}
}

sub EVENT_TIMER {

if($timer == 7 && !defined $spawn)
	{
	quest::spawn2(206074,0,0,$x,$y,$z,0);
        quest::depop;
	}
if($timer == 7 && defined $spawn)
	{
	$spawn=undef;
	quest::stoptimer(7);
	quest::settimer(7,120);
	}
}
