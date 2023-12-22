sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("As rogues of Crescent Reach, the Whisperwalkers live by a different code than most. Our laws bind us to practicing our art for good, not gain. Well, mostly. You might say we rob from those hording ill-gotten gains and give them to the poor. We use our gifts to serve Veeshan and The Six.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}