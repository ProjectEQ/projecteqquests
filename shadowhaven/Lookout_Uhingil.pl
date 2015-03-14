sub EVENT_SIGNAL {
	quest::say("Thank ye General, it's an honor to be part of such a great brigade.");
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Pleased to meet you. $name. Enjoy your stay with us."); }
}
#END of FILE Zone:shadowhaven  ID:150043 -- Lookout_Uhingil 

