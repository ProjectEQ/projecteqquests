# Khati Sha Event
# Created by Gonner

sub EVENT_WAYPOINT_DEPART {
	my $x = $npc->GetX();
	my $y = $npc->GetY();
		if($x = 432 && $y = -298) {
			quest::castspell(154155,6974);
			quest::depop()
		}
}

#END of FILE zone:acrylia ID:154148,154149,154150 -- A_Sacrafice.pl
