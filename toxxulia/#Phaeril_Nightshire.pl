sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there, $name. I am currently patrolling and can not be disturbed. After I am done with my patrol, perhaps I will speak with you. When the night shift comes on duty, I shall be free then.");
  }
}