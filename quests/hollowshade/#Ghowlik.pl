#angelox
##a_grimling_chieftain

sub EVENT_DEATH {
  my $random_result = int(rand(100));
  quest::spawn_condition(hollowshade,4,0); #grimling defenders are 4
  quest::spawn_condition(hollowshade,5,0); #owl defenders are 5
  quest::spawn_condition(hollowshade,6,1); #wolf defenders are 6
  if ($random_result < 51) {
    quest::setglobal("astate",1,3,"F"); #grimlings
    quest::me("Grimlings begin to attack the sonic wolves tribe");
    quest::signal(166146,5);
  }
  else {
    quest::setglobal("astate",2,3,"F"); #owlbears
    quest::me("Owlbears begin to attack the sonic wolf tribe");
    quest::signal(166146,5);
  }
}
