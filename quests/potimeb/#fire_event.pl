my $fnpccounter;

sub EVENT_SPAWN {
    $fnpccounter = 0;
    quest::spawn2(223088,0,0,68,573,504,185.5); #a_flame_mephit
    quest::spawn2(223088,0,0,68,563,504,185.5);
    quest::spawn2(223088,0,0,68,583,504,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14028) {
    $fnpccounter += 1;
}
  if ($fnpccounter == 9 ) {
    quest::spawn2(223090,0,0,68,573,504,185.5); #Kazrok_of_Fire
    $fnpccounter = 0;
}
  if ($signal == 14020) {
    quest::signalwith(223177,14060,0); #tell main about event success
    quest::depop();
}
 }
