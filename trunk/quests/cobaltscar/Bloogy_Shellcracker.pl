sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, strange one. I am Bloogy Shellcracker, the preparer of meals for my people. I am not familiar with the culinary tastes of your kind but you are welcome to purchase some of my supplies. I will also barter for ingredients to some of my exotic dishes.");
  }
  if ($text=~/ingredients/i) {
    quest::say("The rarest treat I can prepare for my people is saucy salted seadragon steak. I wish to barter for some water dragon or sea dragon meat, saltwater seaweed, and fish eggs. The rest of the ingredients are collected locally by our collectors.");
  }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 22812 => 1) || plugin::check_handin(\%itemcount, 22813 => 1)) && plugin::check_handin(\%itemcount, 19113 => 1, 16498 => 2)) {
    quest::say("It has been many moons since my people have feasted on this rarest of meat. Take this totem crafted in the form of our oceanlord Prexus and inscribed with the runes of our people. May the oceans watch over you, $name.");
    quest::summonitem(28514); #Othmir Prexus Totem
    quest::exp(15000);
    quest::faction(241, 30); #Othmir
    quest::faction(345, -60); #Ulthork
  }
  plugin::return_items(\%itemcount);
}