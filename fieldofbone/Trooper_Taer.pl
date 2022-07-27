# items: 18249, 18250
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail! I suggest you stay within the walls of Cabilis. This is no place for you. The Field of Bone is far too close.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("Oh, no! My good times have come to an end. Hand me the note and I shall sign it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18249 => 1)) { #Legion Order (9 signed)
    quest::say("Ha ha! Look at all the names. Ozlot and Frogzin. What lushes. Here you are. I can't imagine there being any others to sign. This is the entire Cabilis brew brigade. Alas... Disbanded forever.");
    quest::summonitem(18250); #Legion Order (all signed)
    quest::faction(441,5); #Legion of Cabilis
    quest::faction(440,5); #Cabilis Residents
    quest::faction(445,5); #Scaled Mystics
    quest::faction(442,5); #Crusaders of Greenmist
    quest::faction(444,5); #Swift Tails
    quest::exp(200);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:fieldofbone  ID:78020 -- Trooper_Taer
