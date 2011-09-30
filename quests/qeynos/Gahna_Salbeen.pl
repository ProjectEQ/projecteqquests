sub EVENT_SIGNAL {
  if($signal == 1) {
	quest::start(57);
	}
  
  if($signal == 2) {
    quest::start(36);
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. This is a grand city. I plan to make much profit here."); }
}
#END of FILE Zone:qeynos  ID:1128 -- Gahna_Salbeen 

