sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Grikk.. Please leave me be. I but a humble forager. My people are starving.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13375 => 1)) {
    quest::say("Grrrikk.. This is Groak's vial!! He must be in danger. Here. Return this liquid to him. Be quick!");
    quest::faction(106,20);
    quest::summonitem(13376);
  }
  plugin::return_items(\%itemcount);
}