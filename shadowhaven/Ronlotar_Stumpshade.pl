sub EVENT_SIGNAL {
	if($signal ==1 ) {
	quest::say("Oh hi there General! Ah can't complain me gots a lot of new customers coming to the shop as of late, but not all of them are rightsizers, ya know? So I tend to lose some sales simply because those big folks come in ere and I just simply don't make shoes dat big!");
	}
	if($signal == 2) {
	quest::say("Will do General, see you soon. Good luck with your rounds.");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I makes da boots. Aye."); }
}
#END of FILE Zone:shadowhaven  ID:150269 -- Ronlotar_Stumpshade 

