# resize crafted armor to small size
#

sub EVENT_SAY {
  if ($faction <= 5) {
    if ($text=~/hail/i) {
      quest::say("Hail! I am Ranvigoz Tonsmith. My brother Timtok and I are some of the finest smiths this side of Kaladim. If you are interested we will happily [resize] your [Crafted Armor] down to a more manageable size.");
    }
    if ($text=~/resize/i) {
      quest::say("I will resize Crafted Bracers, Greaves, a Pauldron or a Breastplate. My brother will resize Crafted Gauntlets, a Vambrace, a Helm or Boots. Just give me the armor and I will resize it for you.");
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
    if (plugin::check_handin(\%itemcount, 4177 => 1)) {
      quest::summonitem(4185);
    }
    elsif (plugin::check_handin(\%itemcount, 4179 => 1)) {
      quest::summonitem(4187);
    }
    elsif (plugin::check_handin(\%itemcount, 4175 => 1)) {
      quest::summonitem(4183);
    }
    elsif (plugin::check_handin(\%itemcount, 4174 => 1)) {
      quest::summonitem(4182);
    }
    else {
      plugin::return_items(\%itemcount);
      return 1;
    }
    quest::say("Here is your armor. I hope it fits better now.");
    quest::faction(47,10); #coalition of tradefolk
    quest::faction(184,10); #knights of truth
    quest::faction(217,10); #merchants of qeynos
    quest::faction(369,10); #coalition of tradefolk iii
  }
}

# EOF zone: commons ID: 21041 NPC: Ranvigoz_Tonsmith

