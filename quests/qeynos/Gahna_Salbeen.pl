my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("daynight",1);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 || $zonetime < 1800)) {
		quest::start(57);
	}
	if (($count == 1) && ($zonetime < 600 || $zonetime > 1799)) {
		quest::stop();
		quest::moveto(-269,-24,3.75,131);
	}	
	if ($count ==2 ) {
	$count = 0;
	quest::settimer("daynight",30);
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. This is a grand city. I plan to make much profit here."); }
}
#END of FILE Zone:qeynos  ID:1128 -- Gahna_Salbeen 

