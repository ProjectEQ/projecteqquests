sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good evening, citizen! It is a fine night for a stroll, but not in the woods. No, no! That would be far too dangerous!");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("I knew this time would come. I will slay you for bringing this to me... No... I'd best not make the officers angry. <sigh> Hand me the order and I shall sign it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18248 => 1)) { #Legion Order (8 signed)
    quest::emote("signs the note and hands back to you. 'Be off now. Before I do choose to slay the messenger.'");
    quest::summonitem(18249); #Legion Order (9 signed)
    quest::exp(200);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:lakeofillomen  ID:5139 -- Trooper_Selbat