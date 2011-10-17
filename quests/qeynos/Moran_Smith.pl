my $count = 0;
sub EVENT_SPAWN {
	quest::SetRunning(1);
	quest::settimer("daynight",1);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 || $zonetime < 1800)) {
		quest::start(60);
	}
	if (($count == 1) && ($zonetime < 600 || $zonetime > 1799)) {
		quest::stop();
		quest::moveto(-268,-38,3.75,243);
	}	
	if ($count ==2 ) {
	$count = 0;
	quest::settimer("daynight",36);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings!!  Moran here.  I just love this city.  I traveled from Freeport to Qeynos to stay far from the [Freeport Militia].");
}
if($text=~/what freeport militia/i){
quest::say("The Freeport Militia are nothing more than thugs.  I have seen them lay waste to more than a dozen adventurers at once.  For no reason other than to flex their muscles!"); }
}
#END of FILE Zone:qeynos  ID:1087 -- Moran_Smith 

