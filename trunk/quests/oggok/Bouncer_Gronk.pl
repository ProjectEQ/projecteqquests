sub EVENT_SPAWN {
	quest::settimer("1",5);
}

sub EVENT_TIMER {
	if ($timer == "1" && $zonetime > 799 && $zonetime < 1201) {
		quest::unique_spawn(49092,0,0,$x,$y,$z,$h);
		$npc->Depop(1);
	}
}

sub EVENT_AGGRO {
  quest::say("Bouncer smash you!!");
}

sub EVENT_SLAY {
  quest::say("Ha!! Bouncers best. I am victorioo.. Victer.. I win!!");
}

