my $fnpccounter;

sub EVENT_SPAWN {
    $occounter = 0;
}  


sub EVENT_SIGNAL {
  if ($signal == 45) {
    $occounter += 1;
}
  if ($occounter == 23 ) {
    quest::signalwith(226072,66,0);
    quest::spawn2(226207,0,0,-1276,1085,-141.62,0);
    quest::depop();
    $occounter = 0;
}
 }