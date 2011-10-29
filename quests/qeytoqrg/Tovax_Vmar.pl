sub EVENT_SPAWN {
	if ($zonetime > 700 || $zonetime < 1899) {
	     $npc->Depop(1);
	}
}

sub EVENT_COMBAT {
	if($combat_state == 1){
		quest::say("Ooh... Aaah!! No! Please! Ouch.... Aarghhhhh!");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}

sub EVENT_WAYPOINT_ARRIVE {
	if (($zonetime > 700 || $zonetime < 1899) && ($wp == 1)) {
	     $npc->Depop(1);
	}
}
