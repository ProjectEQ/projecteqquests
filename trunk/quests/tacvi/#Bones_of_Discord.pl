##Tunat's Loot Chest
sub EVENT_SPAWN {

quest::settimer("Check_Tunat",5);

}


sub EVENT_SIGNAL {

if ($signal == 1) {
$npc->NPCSpecialAttacks("NfD", 0); 
$entity_list->MessageClose($npc, 1, 200, 5, "Bones of Discord rattles and shakes");
quest::npcsize(10);
}
}

sub EVENT_TIMER {

	if ($timer eq "Check_Tunat") {
	quest::stoptimer("Check_Tunat");
	
		if (!defined($qglobals{TunatOne_Dead})) {
		quest::depop(297014);
		quest::spawn2(297014,0,0, 467.4, -172, 26.1, 59 );
		}

		if (defined($qglobals{TunatOne_Dead})) {
		quest::spawn2(297055,0,0, 309, -170.8, 21.3, 59.4);
		}

	}
}


