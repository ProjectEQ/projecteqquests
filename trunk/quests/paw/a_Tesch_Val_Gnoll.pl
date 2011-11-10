sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::emote("growls fiercely, saliva foaming around its ferocious, jagged maw, 'This is our home now!  Begone, or the legions of TomEar shall slay you all!'");
	}
	if($combat_state==0) {
		quest::say("Bbbaarrrrkkk!!!  Another intruder has fallen at the hands of the TomEar.  Who is next to fall?  HHhhooooowwwLLLL!!!");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}
