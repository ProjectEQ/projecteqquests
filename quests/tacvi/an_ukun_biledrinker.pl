sub EVENT_SIGNAL {

if ($signal == 1) {
$npc->NPCSpecialAttacks("SEFQDf", 0);
quest::emote("jaws hunger for fresh meat");
}
}

sub EVENT_DEATH {
quest::emote("falls to the ground");
}
