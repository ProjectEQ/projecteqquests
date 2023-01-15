# resize crafted armor to small size
#
# items: 4178, 4186, 4176, 4184, 4173, 4181, 4180, 4188

sub EVENT_SAY {
  if ($faction <= 5) {
    if ($text=~/hail/i) {
      quest::say("Hail! I am Timtok Tonsmith. My brother Ranvigoz and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
    }
    if ($text=~/resize/i) {
      quest::say("I will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. My brother will resize Crafted Bracers, Greaves, a Pauldrun or a Breastplate. Just give me the armor and I will resize it for you.");
    }
    if ($text=~/crafted armor/i) {
      quest::say("Crafted Armor is made by the Meadowgreen smiths. They can be found in the southern part of the Karanas.");
    }
  }
  else {
    quest::emote("will not speak to you, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 5) {
    if (plugin::check_handin(\%itemcount, 4178 => 1)) {
      quest::summonitem(4186); # Item: Small Crafted Gauntlets
    }
    elsif (plugin::check_handin(\%itemcount, 4176 => 1)) {
      quest::summonitem(4184); # Item: Small Crafted Vambraces
    }
    elsif (plugin::check_handin(\%itemcount, 4173 => 1)) {
      quest::summonitem(4181); # Item: Small Crafted Helm
    }
    elsif (plugin::check_handin(\%itemcount, 4180 => 1)) {
      quest::summonitem(4188); # Item: Small Crafted Plate Boots
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::say("Here is your armor. I hope it fits better now.");
    quest::faction(229,10); #coalition of tradefolk
    quest::faction(281,10); #knights of truth
    quest::faction(291,10); #merchants of qeynos
    quest::faction(5015,10); #coalition of tradefolk iii
  }
}

# EOF zone: commons ID: 21040 NPC: Timtok_Tonsmith

