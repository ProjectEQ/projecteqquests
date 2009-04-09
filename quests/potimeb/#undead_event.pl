my $unpccounter;
my $ubosscount;

sub EVENT_SPAWN {
    $unpccounter = 0;
    $ubosscount = 0;
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,65.2,1109.7,494.8,185.5); #an_undead_guardian
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,65.2,1119.7,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,65.2,1099.7,494.8,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14048) {
    $unpccounter += 1;
}
  if ($unpccounter == 3 ) {
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,67,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,67,1120,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,62,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121),0,0,62,1120,494.8,185.5);
}
  elsif ($unpccounter == 7 ) {
    quest::spawn2(quest::ChooseRandom(223105,223116,223121,223122,223149),0,0,67,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121,223122,223149),0,0,67,1120,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121,223122,223149),0,0,62,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116,223121,223122,223149),0,0,62,1120,494.8,185.5);
}
  elsif ($unpccounter == 11 ) {
    quest::spawn2(223129,0,0,65.2,1109.7,494.8,185.5); #Rythor_of_the_Undead
    quest::spawn2(223150,0,0,65.2,1119.7,494.8,185.5); #an_undead_protector
    quest::spawn2(223150,0,0,65.2,1099.7,494.8,185.5);
    $unpccounter = 0;
}
  if ($signal == 14040) {
    $ubosscount += 1;
}
  if ($ubosscount == 3 ) {
    quest::signalwith(223177,14060,0); #tell main about event success
    $ubosscount = 0;
    quest::depop();
}
 }
