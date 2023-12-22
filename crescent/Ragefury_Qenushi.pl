sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I was surprised to learn of this new people, the drakkin, and promptly came to visit to offer my services to any berserkers here -- and I found none!  Nonetheless, I will stay here to guide and offer training to any berserkers who may pass by.  We don't want any of my kind out there with uncontrolled rage, believe me!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}