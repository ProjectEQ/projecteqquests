# an_aneuk_ebonspirit spawned for ghost trial
sub EVENT_DEATH_COMPLETE {
  my $instid = quest::GetInstanceID("tipt",0);
  quest::signalwith(289047,$instid,0);
}