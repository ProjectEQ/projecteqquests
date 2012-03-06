#Notifies Neffiken Lord of Kelek`Vor  that npc was killed in the camp.

sub EVENT_DEATH {
  quest::signal(210176,0);
}