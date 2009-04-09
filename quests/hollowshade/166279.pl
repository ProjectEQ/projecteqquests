#angelox
#defender2 script grimlin

sub EVENT_DEATH {
#grimlins killed wolves
if (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==1)&&($sstate==3)){
	quest::spawn_condition($zonesn,3,0); #wolves are 3
	quest::spawn_condition($zonesn,2,0); #owls are 2
	quest::spawn_condition($zonesn,1,1); #grimlin are 1
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,5,0); #owl defender are 5
}
#grimlins killed owlbears
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==1)&&($sstate==2)){
	quest::spawn_condition($zonesn,3,0); #wolves are 3
	quest::spawn_condition($zonesn,2,0); #owls are 2
	quest::spawn_condition($zonesn,1,1); #grimlin are 1
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,5,0); #owl defender are 5
}
#owls killed gremlins
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==1)){
	quest::spawn_condition($zonesn,3,0);
	quest::spawn_condition($zonesn,2,1);
	quest::spawn_condition($zonesn,1,0);
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
}
#owls killed  wolves
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==2)&&($sstate==3)){
	quest::spawn_condition($zonesn,3,0);
	quest::spawn_condition($zonesn,2,1);
	quest::spawn_condition($zonesn,1,0);
	quest::spawn_condition($zonesn,6,0); #wolf defender are 6
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
}
#wolves killed owls
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==2)){
	quest::spawn_condition($zonesn,3,1);
	quest::spawn_condition($zonesn,2,0);
	quest::spawn_condition($zonesn,1,0);
	quest::spawn_condition($zonesn,5,0); #owl defender are 5
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
}
#wolves killed grimlins
elsif (($defder1==1)&&($defder2==1)&&($defder3==1)&&($defder4==1)&&($defder5==1)&&($astate==3)&&($sstate==1)){
	quest::spawn_condition($zonesn,3,1);
	quest::spawn_condition($zonesn,2,0);
	quest::spawn_condition($zonesn,1,0);
	quest::spawn_condition($zonesn,5,0); #owl defender are 5
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
}else{
	quest::delglobal("defder2");
	quest::setglobal("defder2",1,3,"F");
	$defder2=undef;
 }
}