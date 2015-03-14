# #115040 Initiate Corrith fighting

sub EVENT_SPAWN {
  quest::settimer(2,30); #Make them attack every 30 seconds.
}
sub EVENT_TIMER {
  quest::doanim(2);
  #$entity_list->GetMobByNpcTypeID(115176)->DoAnim(2);
}