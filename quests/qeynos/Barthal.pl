my $count = 0;
sub EVENT_SPAWN {
	quest::settimer("daynight",1);
}

sub EVENT_TIMER {
	$count++;
	if (($count == 1) && ($zonetime > 599 || $zonetime < 1800)) {
		quest::start(61);
	}
	if (($count == 1) && ($zonetime < 600 || $zonetime > 1799)) {
		quest::stop();
		quest::moveto(-276,-32,3.75,50);
	}	
	if ($count ==2 ) {
	$count = 0;
	quest::settimer("daynight",28);
	}
}

sub EVENT_SIGNAL {
  if($signal == 3) {
    quest::say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name! We've got the best prices in town..  No need to shop around..  Heh, heh. I think I'll make that my new slogan!"); }
}
#END of FILE Zone:qeynos  ID:1123 -- Barthal 

