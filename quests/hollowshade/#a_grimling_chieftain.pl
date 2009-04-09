#angelox
##a_grimling_chieftain 

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition($zonesn,4,1); #grimlin defender are 4
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,5,0); #owl defender are 5
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",3,3,"F"); #wolves
	$astate=undef;
	quest::me("Sonic wolves begins to attack the grimlin camp");
	quest::signal(166179,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",2,3,"F"); #owlbears
	$astate=undef;
	quest::me("Owlbears begin to attack the grimlin camp");
	quest::signal(166179,5);
  }
}
