sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, lost soul. I am a guide, automaton series G. I can assist you by leading you to all the important destinations in Ak'Anon. All you need to do is ask 'where' and state a valid destination. ..Bzzz.. Click!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:55066 -- Guide_V