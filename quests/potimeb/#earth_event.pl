my $enpccounter;

sub EVENT_SPAWN {
    $enpccounter = 0;
    quest::spawn2(223106,0,0,70.3,1644.5,493.7,185.5); #a_pile_of_living_rubble
    quest::spawn2(223106,0,0,70.3,1654.5,493.7,185.5);
    quest::spawn2(223106,0,0,70.3,1634.5,493.7,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14018) {
    $enpccounter += 1;
}
  if ($enpccounter == 8 ) {
    quest::spawn2(223119,0,0,70.3,1644.5,493.7,185.5); #Terlok_of_Earth
    $enpccounter = 0;
}
  if ($signal == 14010) {
    quest::signalwith(223177,14060,0); #tell main about event success
    quest::depop();
}
 }
