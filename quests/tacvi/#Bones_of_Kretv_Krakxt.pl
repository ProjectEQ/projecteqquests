##Tunat's Loot Chest
sub EVENT_SPAWN {
#quest::say("glow black");
quest::depop(298201);
quest::spawn2(298201,0,0, 175, 242, -7, 9 );
}


sub EVENT_SIGNAL {

if ($signal == 1) {
$npc->NPCSpecialAttacks("NfD", 0); 
$entity_list->MessageClose($npc, 1, 200, 5, "Bones of Kretv Krakxt rattles and shakes");
quest::npcsize(5);
}
}

sub EVENT_TIMER {
if ($timer eq "rattle") {
$entity_list->MessageClose($npc, 1, 200, 5, "a Royal Chest rattles and shakes");
quest::doanim(12);
}
}


