sub EVENT_SPAWN{
   my $randgend = quest::ChooseRandom(0, 1);
   quest::npcgender($randgend);
}