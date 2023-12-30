sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You dare speak to one of the Six? You have much to prove before I will entertain your babble. I suggest you speak to Council Aide Mystrana.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}