#Notifies Neffiken Lord of Kelek`Vor  that npc was killed in the camp.

sub EVENT_DEATH_COMPLETE {
  quest::signal(210176,0); # NPC: Neffiken_Lord_of_Kelek`Vor
}