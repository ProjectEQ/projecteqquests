# items: 5850, 5849, 5848, 4489, 3957, 5844, 5698, 4492, 5699, 3954, 4494, 5981, 5847, 3956, 5845, 4493, 5846, 3955, 5690, 4488, 5691, 3950, 4491, 5696, 5697, 3953
sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Oh hello there, I'm in charge of the docks here and wife to Alton.");
  }
  if ($text=~/ranger/i) {
    quest:say("Very well. If you want the Woodsman's [Mantle], Woodsman's [Mask], Woodsman's [Cape], Woodsman's [Gauntlets], Woodsman's [Choker], or Woodsman's [Belt] I have some errands that need to be done.");
  }
  if ($text=~/armor/i) {
    quest:say("Oh you wish to get the armor that Alton's great granddaddy used to wear. If you are a ranger just let me know.");
  }
  if ($text=~/belt/i) {
    quest:say("If you want the Woodsman's Belt bring me a moon jewel, a mark of the environment, a gold pointer, and a broken ancient blade.");
  }
  if ($text=~/cape/i) {
    quest:say("If you want the Woodsman's Cape bring me a sky jewel, a mark of creatures, a wondrous stone, and a marble statuette.");
  }
  if ($text=~/choker/i) {
    quest:say("If you want the Woodsman's Choker bring me an astral jewel, a mark of ambidexterity, and a small ancient sculpture.");
  }
  if ($text=~/gauntlets/i) {
    quest:say("If you want the Woodsman's Gauntlets bring me a meteor jewel, a mark of animals, and a tattered old card.");
  }
  if ($text=~/mantle/i) {
    quest:say("If you want the Woodsman's Mantle bring me a sun jewel, a mark of rivers, and a temporal sack.");
  }
  if ($text=~/mask/i) {
    quest:say("If you want the Woodsman's Mask bring me a cloud jewel, a mark of stone, and a platinum chain.");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5850 => 1, 5849 => 1, 5848 => 1, 4489 => 1)) { #belt
    quest::summonitem(3957); # Item: Woodsman's Girdle
    quest::emote("smiles at you.");
    quest::say("Thank You! Here is your payment.");
    quest::exp(25000);
  }
  if (plugin::check_handin(\%itemcount, 5844 => 1, 5698 => 1, 4492 => 1, 5699 => 1)) { #cape
    quest::summonitem(3954); # Item: Woodsman's Cape
  }
  if (plugin::check_handin(\%itemcount, 4494 => 1, 5981 => 1, 5847 => 1)) { #choker
    quest::summonitem(3956); # Item: Woodsman's Gorget
  }
  if (plugin::check_handin(\%itemcount, 5845 => 1, 4493 => 1, 5846 => 1)) { #gaunts
    quest::summonitem(3955); # Item: Woodsman's Gauntlets
  }
  if (plugin::check_handin(\%itemcount, 5690 => 1, 4488 => 1, 5691 => 1)) { #mantle
    quest::summonitem(3950); # Item: Woodsman's Mantle
  }
  if (plugin::check_handin(\%itemcount, 4491 => 1, 5696 => 1, 5697 => 1)) { #mask
    quest::summonitem(3953); # Item: Woodsman's Mask
 
  }
}

#not sure on exp reward amount, return items if not all given all?
