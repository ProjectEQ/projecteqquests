sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. I am Denken Strongpick. I wish I could get off this rock, silly clan honor. My boss broke our rebreathers and we can not go back to the mainland before wegather some [goblin relics].");
  }
  if ($text=~/goblin relics/i) {
    quest::say("There are supposedly goblin ruins around here somewhere. Fendlemend thinks we will find paydirt underwater. We did find [one thing].");
  }
  if ($text=~/one thing/i) {
    quest::say(" We found a very fine sword blade. Denken pulls open his pack and shows you a razor sharp sword covered with runes. I can't figure out what type of metal it is and I sure can't figure out what technique was used to forge it. Perhaps you would like to take it off my hands and [buy] it?");
  }
  if ($text=~/buy/i) {
    quest::say("Out here, money is fairly useless to me. You see, I can't leave Fendlemend out here alone. I signed on with a very detailed contract. I could sure [use] a few things from the mainland though.");
  }
  if ($text=~/use/i) {
    quest::say("I would be willing to part with this very fine blade for a keg of Vox tail ale, a block of permafrost to keep it cool and two new rebreathers to get this operation back underway.");
  }
}

sub EVENT_ITEM {
  # 16889 :  Rebreather x2
  # 20665 :  Block of Permafrost
  # 20664 :  Keg of Vox Tail Ale
  if (plugin::check_handin(\%itemcount,16889=>2,20665=>1,20664=>1)) {
    quest::summonitem(20667); # 20667  Ancient Sword Blade
    quest::exp(50000); 
    quest::ding();
    quest::say("Excellent! Here is your sword. I feel like I'm at home already!");
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:oot  NPC:69061 -- Denken_Strongpick
