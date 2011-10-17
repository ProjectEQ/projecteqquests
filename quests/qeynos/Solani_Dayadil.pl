my $count = 0;
sub EVENT_SPAWN {
	quest::SetRunning(1);
	quest::settimer("daynight",1);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 || $zonetime < 1800)) {
		quest::start(59);
	}
	if (($count == 1) && ($zonetime < 600 || $zonetime > 1799)) {
		quest::stop();
		quest::moveto(-260,-26,3.75,176);
	}	
	if ($count ==2 ) {
	$count = 0;
	quest::settimer("daynight",34);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("If you are a fellow merchant. I must warn you of the inevitable tax increase.  Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
}
if($text=~/what deal/i){
quest::say("Bayle is soon to sign a law which will raise the taxes on all bear hides.  This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!"); }
}
#END of FILE Zone:qeynos  ID:1102 -- Solani_Dayadil 

