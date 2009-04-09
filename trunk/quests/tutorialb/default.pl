sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Shh , I think I hear the kobolds.");  
  }
}