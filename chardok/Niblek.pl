# Part of quest for Veeshan's Peak key

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I Niblek. You want something from Niblek?  Niblek find treasures in walls. Niblek like to trade treasures.");
  }
  if ($text=~/treasures/i) {
    quest::say("Niblek find piece of old jewelry! It very old, probably has much power!");
  }
  if ($text=~/want/i) {
    quest::say("Niblek likes shiny tings very much! You bring Niblek two shiny tings! Niblek has seen black sapphire and ruby! Niblek likes them very much!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10036 => 1, 10035 => 1)) {
    quest::say("I much happy now!! I want shiny tings for long time! I give you ugly broken necklace now!");
    quest::summonitem(19964);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

# Quest by mystic414