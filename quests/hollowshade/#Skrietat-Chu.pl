#angelox
##Skrietat`Chu

sub EVENT_DEATH {
  my $random_result = int(rand(100));
  quest::spawn_condition($zonesn,4,0); #grimling defenders are 4
  quest::spawn_condition($zonesn,5,1); #owl defenders are 5
  quest::spawn_condition($zonesn,6,0); #wolf defenders are 6
  if ($random_result < 51) {
    quest::setglobal("astate",3,3,"F"); #wolves
    quest::me("Sonic wolves begin to attack the owlbear tribe");
    quest::signal(166217,5);
  }
  else {
    quest::setglobal("astate",1,3,"F"); #grimlings
    quest::me("Grimlings begin to attack the owlbear tribe");
    quest::signal(166217,5);
  }
}
