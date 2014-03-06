##ZMD Loot Chest
sub EVENT_SPAWN {
#quest::say("glow black");
quest::depop(297020);
quest::spawn2(297020,0,0, 367, 145, -7, 190 );
}


sub EVENT_SIGNAL {

if ($signal == 1) {
$npc->NPCSpecialAttacks("NfD", 0); 
$entity_list->MessageClose($npc, 1, 200, 5, "Bones of Mordl Delt rattles and shakes");
quest::npcsize(5);
}
}

sub EVENT_TIMER {
if ($timer eq "rattle") {
$entity_list->MessageClose($npc, 1, 200, 5, "a Royal Chest rattles and shakes");
quest::doanim(12);
}
}

