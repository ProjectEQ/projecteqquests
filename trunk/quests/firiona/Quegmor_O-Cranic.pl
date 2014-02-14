sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings traveler! There are many strange beasts that inhabit these lands with behavioral patterns different than those of the antonican beasts I have trained with. I hope to one day have mastered these foreign beasts so that my wisdom and spirit may be expanded.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84196 -- Quegmor_O`Cranic