sub EVENT_SPAWN  {
	quest::settimer(1,600);
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		if(defined($qglobals{bic_fer}) && ($qglobals{bic_fer} == 10)) {
			$client->Message(4,"You feel a chill surround your body as a voice enters your mind. 'Thank you for releasing me from an eternity of suffering. Now you must help the others on this continent whose fate I fear is much worse than mine. You must seek out Apprentice Udranda in Barindu. She can help you gain access to the temples beyond the mountain passes.");
			quest::summonitem(67526);
			quest::setglobal("bic_fer", 11, 5, "F");
		}
		quest::setglobal("god_vxed_access", 1, 5, "F");
		$client->Message(4,"You receive a character flag!");
	}
}

sub EVENT_TIMER {
	quest::depop();
}