# Part of quest for Incandescent Wand

sub EVENT_ITEM {
  # Text is completely made up
  if(($itemcount{6338} == 1) && ($gold == 50)) {
    quest::say("I have done everything in my power to enchant this wand, but I fear it is not enough.  Take the wand to Raine Beteria in Erudin; she should be able to finish its enchantments.  Do not forget to pay her for the service, as you did me.");
    quest::summonitem(6339);
    quest::exp(1000);
  }
}

# Quest by mystic414

