sub EVENT_SPAWN {
    quest::settimer(1,20);  #move timer
}

sub EVENT_TIMER {
    if($timer == 1) {
	quest::stoptimer(1);
	quest::settimer(2,20);
	$npc->GMMove(-55,-653,-127,121);  #move loc true
        $npc->WipeHateList();
    }
    if($timer == 2) {
	quest::stoptimer(2);
	quest::settimer(1,20);
        $npc->GMMove(-103,-652,-127,125);	#move loc mirror
	$npc->WipeHateList();
    }
}

sub EVENT_ATTACK {
  $npc->CastSpell(2490,$client);  #casts detonation on being attacked
}
