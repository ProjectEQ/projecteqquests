sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21987 => 1)) {#need correct text
    quest::say("It has been a long time since someone has come for my herbs.  I do still have them however.  I knew that the elves would remember I was out here.  Here is the antidote you require.");
    quest::summonitem(21988);
  }
}