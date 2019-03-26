#Notifies Drornok_Trigger that a tempest toad was killed

sub EVENT_DEATH_COMPLETE {
  quest::signal(210241,0); # NPC: Drornok_Trigger
}