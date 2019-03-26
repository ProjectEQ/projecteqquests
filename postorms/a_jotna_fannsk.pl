#Notifies Gurebk_Lord_of_Krendic that npc was killed in the camp.

sub EVENT_DEATH_COMPLETE {
  quest::signal(210178,0); # NPC: Gurebk_Lord_of_Krendic
}