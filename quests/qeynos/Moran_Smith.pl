sub EVENT_SIGNAL {
  if($signal == 1) {
	quest::start(60);
	quest::SetRunning(1);
	}
  
  if($signal == 2) {
    quest::start(28);
	quest::SetRunning(0);
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings!!  Moran here.  I just love this city.  I traveled from Freeport to Qeynos to stay far from the [Freeport Militia].");
}
if($text=~/what freeport militia/i){
quest::say("The Freeport Militia are nothing more than thugs.  I have seen them lay waste to more than a dozen adventurers at once.  For no reason other than to flex their muscles!"); }
}
#END of FILE Zone:qeynos  ID:1087 -- Moran_Smith 

