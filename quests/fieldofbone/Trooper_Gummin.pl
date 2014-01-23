sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Beware the bone field beyond the path. It is said that the bones of a thousand fallen warriors walk its grounds at night.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("Blast! The masters have condemned me to a life of sobriety and bloodshed! At least I still have bloodshed. But I would like one last drink. I would like a bottle of Legion Lager from Cabilis. Bring me the lager and the legion order and then I shall sign it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18242 => 1, 12463 => 1)) { #Legion Order (2 signed), Legion Lager
    quest::emote("slowly signs the order. '...Love, Innoruuk. There you go. Now run along. Let me enjoy my last brew alone.'");
    quest::summonitem(18243); #Legion Order (3 signed)
    quest::faction(193,5); #Legion of Cabilis
    quest::faction(30,5); #Cabilis Residents
    quest::faction(282,5); #Scaled Mystics
    quest::faction(62,5); #Crusaders of Greenmist
    quest::faction(317,5); #Swift Tails
    quest::exp(500);
  }
  elsif (plugin::check_handin(\%itemcount, 18242 => 1) {
    quest::say("What?! I need the Legion Lager and the legion order.");
    quest::summonitem(18242);
  }
  elsif (plugin::check_handin(\%itemcount, 12463 => 1) {
    quest::say("What?! I need the Legion Lager and the legion order.");
    quest::summonitem(12463);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:fieldofbone  ID:78069 -- Trooper_Gummin