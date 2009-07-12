#Notifies Drornok_Trigger that a tempest toad was killed
sub EVENT_DEATH {
  quest::signal(210241,0);
}