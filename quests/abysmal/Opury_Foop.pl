sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("My brother is an adventurer like you.  He left to explore the new continent a couple of days ago.  I hope he is okay.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67514 =>1, 67515 =>1 )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 4) {
      quest::say("Ah the journal of Talwin.  I heard that he was friends with a slave girl, Proteri Amari was her name.  Maybe she can help you out.");  #need live text
      quest::setglobal("bic",5,5,"F");
    }
  }
  else {
    plugin::return_items(\%itemcount);
  }
}