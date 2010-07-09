sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name. you may call me Tolah. Please feel free to peruse my wares. I think you'll find my prices very fair considering the risk I am taking to bring them here. If not. you can always go all the way to town to do your shopping."); }
}
#END of FILE Zone:hollowshade  ID:166012 -- Tolah_Rakknak - (Really? Is this the end? Look below...)

sub EVENT_SPAWN {
#reset globals (Where is "sstate"?)
	quest::setglobal("defder1",0,3,"F");
	quest::setglobal("defder2",0,3,"F");
	quest::setglobal("defder3",0,3,"F");
	quest::setglobal("defder4",0,3,"F");
	quest::setglobal("defder5",0,3,"F");
	quest::setglobal("astate",1,3,"F");
#starts zone with gremlins, resets everything
	quest::spawn_condition($zonesn,3,0); #wolves are 3
	quest::spawn_condition($zonesn,2,0); #owls are 2
	quest::spawn_condition($zonesn,1,1); #grimlin are 1
	quest::spawn_condition($zonesn,4,0); #grimlin defender are 4
	quest::spawn_condition($zonesn,5,0); #owls defender are 5
	quest::spawn_condition($zonesn,6,0); #wolves defender are 6

}
# EOF zone: Hollowshade  Global Watcher - (This needs to be looked at. Was this from a different file?)