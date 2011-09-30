sub EVENT_SIGNAL {
  if($signal == 1) {
	quest::start(61);
	}
  if($signal == 2) {
    quest::start(35);
	}
  if($signal == 3) {
    quest::say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name! We've got the best prices in town..  No need to shop around..  Heh, heh. I think I'll make that my new slogan!"); }
}
#END of FILE Zone:qeynos  ID:1123 -- Barthal 

