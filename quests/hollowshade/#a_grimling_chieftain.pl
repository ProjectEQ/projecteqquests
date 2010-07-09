#angelox
##a_grimling_chieftain

sub EVENT_DEATH {
  my $random_result = int(rand(100));
  quest::spawn_condition($zonesn,4,1); #grimling defenders are 4
  quest::spawn_condition($zonesn,5,0); #owl defenders are 5
  quest::spawn_condition($zonesn,6,0); #wolf defenders are 6
  if ($random_result < 51) {
    quest::setglobal("astate",3,3,"F"); #wolves
    quest::me("Sonic wolves begin to attack the grimling camp");
    quest::signal(166179,5);
  }
  else {
    quest::setglobal("astate",2,3,"F"); #owlbears
    quest::me("Owlbears begin to attack the grimling camp");
    quest::signal(166179,5);
  }
}
