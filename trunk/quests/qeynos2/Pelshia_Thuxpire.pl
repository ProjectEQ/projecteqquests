sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Um, just fine, Knargon. What do you want now, huh?");
    quest::signalwith(2072,1,1);
	}
  if($signal == 2) {
	quest::say("How about you go, and I'll catch up with you... never?");
    }
}
