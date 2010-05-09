sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello.  The Wayfarers Brotherhood welcomes you to the Queen of Thorns and to Taelosia.  Please come in and rest, if you are [weary].");
  }
  if ($text=~/weary/i) {
    quest::say("There are several places to rest, read and relax here.  This was to be Morden's quarters and meeting rooms, but he refuses to use them and spends most of his time elsewhere.  When he is here, he sleeps wherever he grows tired, most often on deck.  So we have made use of them as a place to recover from a tiring day.  Make yourself at home.");
  }
}
sub EVENT_ITEM {
 plugin::return_items(\%itemcount); 
}