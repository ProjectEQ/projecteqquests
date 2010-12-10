#angelox
#defender5 script owl

sub EVENT_DEATH {
    quest::setglobal("defder1",1,3,"F");
    #grimlins killed wolves
    if (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==1)&&($qglobals{sstate}==3)){
                    quest::spawn_condition($zonesn,3,0); #wolves are 3
                    quest::spawn_condition($zonesn,2,0); #owls are 2
                    quest::spawn_condition($zonesn,1,1); #grimlin are 1
                    quest::spawn_condition($zonesn,6,0); #wolf defender are 6
                    quest::spawn_condition($zonesn,5,0); #owl defender are 5
                }
    #grimlins killed owlbears
    elsif (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==1)&&($qglobals{sstate}==2)){
                    quest::spawn_condition($zonesn,3,0); #wolves are 3
                    quest::spawn_condition($zonesn,2,0); #owls are 2
                    quest::spawn_condition($zonesn,1,1); #grimlin are 1
                    quest::spawn_condition($zonesn,6,0); #wolf defender are 6
                    quest::spawn_condition($zonesn,5,0); #owl defender are 5
                }
    #owls killed gremlins
    elsif (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==2)&&($qglobals{sstate}==1)){
                    quest::spawn_condition($zonesn,3,0);
                    quest::spawn_condition($zonesn,2,1);
                    quest::spawn_condition($zonesn,1,0);
                    quest::spawn_condition($zonesn,6,0); #wolf defender are 6
                    quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
                }
     #owls killed  wolves
     elsif (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==2)&&($qglobals{sstate}==3)){
                    quest::spawn_condition($zonesn,3,0);
                    quest::spawn_condition($zonesn,2,1);
                    quest::spawn_condition($zonesn,1,0);
                    quest::spawn_condition($zonesn,6,0); #wolf defender are 6
                    quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
                }
     #wolves killed owls
     elsif (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==3)&&($qglobals{sstate}==2)){
                    quest::spawn_condition($zonesn,3,1);
                    quest::spawn_condition($zonesn,2,0);
                    quest::spawn_condition($zonesn,1,0);
                    quest::spawn_condition($zonesn,5,0); #owl defender are 5
                    quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
                }
     #wolves killed grimlins
     elsif (($qglobals{defder1}==1)&&($qglobals{defder2}==1)&&($qglobals{defder3}==1)&&($qglobals{defder4}==1)&&($qglobals{defder5}==1)&&($qglobals{astate}==3)&&($qglobals{sstate}==1)){
                    quest::spawn_condition($zonesn,3,1);
                    quest::spawn_condition($zonesn,2,0);
                    quest::spawn_condition($zonesn,1,0);
                    quest::spawn_condition($zonesn,5,0); #owl defender are 5
                    quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
     }else{
	quest::delglobal("defder1");
	quest::setglobal("defder1",1,3,"F");
	$defder1=undef;
 }
}


