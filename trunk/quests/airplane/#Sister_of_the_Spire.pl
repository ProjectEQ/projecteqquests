sub EVENT_DEATH_COMPLETE {
  $sirran= undef;
  quest::setglobal(sirran,7,3,"M20");
  quest::spawn2(71058,0,0,-960,-1037,1093,64);
}
