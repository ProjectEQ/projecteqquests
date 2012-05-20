sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_SAY {
     if($text=~/Hail/i) {
          quest::say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
     }
}
