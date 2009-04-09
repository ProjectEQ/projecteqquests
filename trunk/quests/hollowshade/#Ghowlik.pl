#angelox
##a_grimling_chieftain 

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition(hollowshade,4,0); #grimlin defender are 4
	quest::spawn_condition(hollowshade,6,1); #wolf defender are 6
	quest::spawn_condition(hollowshade,5,0); #owl defender are 5
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",1,3,"F"); #grimlins
	$astate=undef;
	quest::me("Grimlins begin to attack the sonic wolves tribe");
	quest::signal(166146,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",2,3,"F"); #owlbears
	$astate=undef;
	quest::me("Owlbears begin to attack the sonic wolf tribe");
	quest::signal(166146,5);
  }
}
