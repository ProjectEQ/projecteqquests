sub EVENT_SPAWN
{
    quest::setglobal("defder1",0,3,"F");
    quest::setglobal("defder2",0,3,"F");
    quest::setglobal("defder3",0,3,"F");
    quest::setglobal("defder4",0,3,"F");
    quest::setglobal("defder5",0,3,"F");
    quest::setglobal("astate",0,3,"F");
    my $mobstate = 1;
    if (defined $qglobals{sstate}){
        $mobstate = $qglobals{sstate};
    }
    quest::spawn_condition($zonesn,3,0); #wolves are 3
    quest::spawn_condition($zonesn,2,0); #owls are 2
    quest::spawn_condition($zonesn,1,0); #grimlin are 1
    quest::spawn_condition($zonesn,"$mobstate",1); 
    quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
    quest::spawn_condition($zonesn,5,0); #owls defender are 5
    quest::spawn_condition($zonesn,6,0); #wolves defender are 6

}
# EOF zone: Hollowshade Global Watcher  