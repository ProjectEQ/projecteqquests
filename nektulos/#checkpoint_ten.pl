sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
	if(quest::istaskactivityactive(216,9)){
		if(defined $qglobals{halloween_race_start}) {
			quest::setglobal("halloween_race_victory",1,1,"D30");
			quest::updatetaskactivity(216,9);
		}
		else {
			quest::updatetaskactivity(216,9);
		}
	}
}
		