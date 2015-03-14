# #115176 Initiate Sircthain fighting
sub EVENT_SPAWN {
  quest::settimer(2,(rand(40)+10)); #Make them attack every 10-40 seconds.
}
sub EVENT_TIMER {
  quest::doanim(2);
  #$entity_list->GetMobByNpcTypeID(115040)->DoAnim(2);
  quest::settimer(2,(rand(40)+10)); #Make them attack every 10-40 seconds.
}