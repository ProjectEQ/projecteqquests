# spawn shissar wraiths on death of emperor ssraeshza for celestial rifts
#
sub EVENT_SPAWN {
	quest::settimer("depopemp", 600);
}

sub EVENT_AGGRO {
	quest::stoptimer("depopemp");
	quest::settimer("depopemp", 2400);
}

sub EVENT_TIMER {
	if ($timer eq "depopemp") {
		quest::spawn2(162065, 0, 0, 993.3, -325.0, 415.0, 192.5);
		quest::signalwith(162203, 97, 0);
		quest::stoptimer("depopemp");
		quest::depop();
	}
}

sub EVENT_DEATH {
  quest::emote("'s corpse says 'How...did...ugh...'");
  quest::spawn2(162210,0,0,953,-332,403.1,190);
  quest::spawn2(162210,0,0,953,-324,403.1,190);
  quest::spawn2(162210,0,0,953,-316,403.1,190);
  quest::spawn2(162210,0,0,937,-332,403.1,190);
  quest::spawn2(162210,0,0,937,-324,403.1,190);
  quest::spawn2(162210,0,0,937,-316,403.1,190);
  quest::signalwith(162260, 96, 0);
}

#Just a little flavor for when Emperor kills someone.

sub EVENT_SLAY {
  quest::say("Your god has found you lacking.");
}

# EOF zone: ssartemple ID: 162227 NPC: #Emperor_Ssraeshza_

