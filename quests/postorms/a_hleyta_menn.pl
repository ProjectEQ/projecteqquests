#Notifies Jeplak_Lord_of_Srerendi that npc was killed in the camp.

sub EVENT_DEATH_COMPLETE {
  quest::signal(210179,0);
}