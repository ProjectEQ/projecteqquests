sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("So patronizing you are. Shoo! I have no need of your help and likewise - you have no need of mine.");
  }
}