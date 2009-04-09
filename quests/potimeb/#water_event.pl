my $wnpccounter;

sub EVENT_SPAWN {
    $wnpccounter = 0;
    quest::spawn2(223104,0,0,68,867,495,185.5); #Anar_of_Water
    quest::spawn2(223192,0,0,68,877,495,185.5); #a_regrua_defender
    quest::spawn2(223192,0,0,68,857,495,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14038) {
    $wnpccounter += 1;
}
  if ($wnpccounter == 7 ) {
    quest::signalwith(223177,14060,0); #tell main about event success
    $wnpccounter = 0;
    quest::depop();
}
 }
