sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_SAY {
 if($text=~/Hail/i) {
   quest::say("No time to talk!! I must be off. The grains of sand are falling and I must prove that we paladins from the Temple of Thunder are the quickest.");
  }
}
