#Notifies Gurebk_Lord_of_Krendic that npc was killed in the camp.

sub EVENT_DEATH {
  quest::signal(210178,0);
}