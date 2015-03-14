sub EVENT_SPAWN {
	quest::settimer(1,1200);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("I must thank you for your kind efforts friends. This place has laid claim to me for far too long. Please take care and offer the dark wench my best. I am off... and I suggest you not stray to far from that route yourselves. Please tell me when you are ready to return and may your blades strike true!");
		quest::setglobal("pop_pot_newleaf",1,5,"F");
		$client->Message(4,"You receive a character flag!");
	}

	if ($text=~/ready/i) {
		$client->Message(4,"Your tormented visions have ended");
		quest::movepc(207,-16,-49,452);
	}
}

# End of File  Zone: PoTorment ID: 207066 -- #Tylis_Newleaf
# Romai