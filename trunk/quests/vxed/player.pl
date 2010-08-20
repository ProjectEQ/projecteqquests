sub EVENT_ENTERZONE  {
 if (defined $qglobals{god_tipt_access} && $qglobals{got_tipt_access} == 1) {
  quest::settimer(30);
}
} 
sub EVENT_TIMER {
   quest::depop(290065);
}
sub EVENT_COMBINE_SUCCESS {
  if($recipe_id == 10344) {
  quest::spawn2(290059,0,0,$x,$y,$z,$h);
  }
 }