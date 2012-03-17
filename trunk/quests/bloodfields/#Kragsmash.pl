sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Get out of my face. I have no time for you.");
  }
}