#angelox
##Skrietat`Cha 

sub EVENT_DEATH {
	my $random_result = int(rand(100));
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,5,1); #owl defender are 5
 if($random_result<51){
	quest::delglobal("astate");
	quest::setglobal("astate",3,3,"F"); #wolves
	$astate=undef;
	quest::me("Sonic wolves begins to attack the owlbear tribe");
	quest::signal(166217,5);
  }else{
	quest::delglobal("astate");
	quest::setglobal("astate",1,3,"F"); #gremlins
	$astate=undef;
	quest::me("Grimlins begins to attack the owlbear tribe");
	quest::signal(166217,5);
  }
}
