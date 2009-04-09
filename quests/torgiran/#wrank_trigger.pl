my $wcounter;
my $ocounter;

sub EVENT_SPAWN {
   $wcounter = 0;
   $ocounter = 0;
   quest::spawn2(226066,0,0,479,197,3,191);
   }

sub EVENT_SIGNAL {
  if ($signal == 23) {
    $wcounter += 1;
}
  if ($signal == 24) {
    $wcounter += 2;
}
  if ($signal == 25) {
    $wcounter += 3;
}
  if ($signal == 26) {
    $wcounter += 4;
}
  if ($wcounter == 20 ) { 
    quest::spawn2(226109,0,0,109,62,2.7,215);
    quest::spawn2(226203,0,0,109,195,2.7,215);
    quest::spawn2(226202,0,0,220,195,2.7,215);
    quest::spawn2(226201,0,0,220,62,2.7,215); 
    $wcounter = 0;
}
  if ($signal == 33) {
    $ocounter += 1;
}
  if ($ocounter == 4 ) {
    quest::signalwith(226066,66,0);
    quest::spawn2(226095,0,0,479,197,3,191);
    quest::depop();
    $ocounter = 0;
}
 }
   