# Rhaliq_Trell_ NPCID 211105
# hail version for villiagers trial

sub EVENT_SPAWN {
	quest::shout("Clever ones you are!");
	quest::settimer(1,600);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_SAY {
	if($text=~/hail/i  && !defined($qglobals{pop_hoh_trell})) {
			quest::say("Congratulations... Two other trials and you may have proven yourself worthy to stand before Lord Marr.");
			quest::setglobal("pop_hoh_trell", 1, 5, "F");
			$client->Message(4,"You receive a character flag!");
	}
}