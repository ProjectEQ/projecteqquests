sub EVENT_SIGNAL {
  if($signal == 1) {
	quest::start(58);
	}
  
  if($signal == 2) {
    quest::start(32);
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Go to the taverns if you're looking for talk."); }
}
#END of FILE Zone:qeynos  ID:1103 -- Bassanio_Weekin 

