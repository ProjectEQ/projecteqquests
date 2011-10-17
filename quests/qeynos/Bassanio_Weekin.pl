my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("daynight",1);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 || $zonetime < 1800)) {
		quest::start(58);
	}
	if (($count == 1) && ($zonetime < 600 || $zonetime > 1799)) {
		quest::stop();
		quest::moveto(-262,-31,3.75,194);
	}	
	if ($count ==2 ) {
	$count = 0;
	quest::settimer("daynight",32);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Go to the taverns if you're looking for talk."); }
}
#END of FILE Zone:qeynos  ID:1103 -- Bassanio_Weekin 

