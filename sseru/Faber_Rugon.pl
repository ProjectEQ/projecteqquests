# items: 31787, 29879, 31788, 31966, 29878, 31965, 29876, 31968, 29880, 31967, 29877
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31787 => 2)) {
    quest::summonitem(29879); # Item: Lightcrawler Breastplate
  }
  if (plugin::check_handin(\%itemcount, 31788 => 2, 31966 => 2)) {
    quest::summonitem(29878); # Item: Lightcrawler Greaves
   }
  if (plugin::check_handin(\%itemcount, 31965 => 2)) {
    quest::summonitem(29876); # Item: Lightcrawler Helm
   }
  if (plugin::check_handin(\%itemcount, 31968 => 2)) {
    quest::summonitem(29880); # Item: Lightcrawler Bracer
   }
  if (plugin::check_handin(\%itemcount, 31967 => 2)) {
    quest::summonitem(29877); # Item: Lightcrawler Vambraces
  quest::say("Oh, this is a fine piece of armor I made for ya!");
  quest::exp(25000);
  }
  plugin::return_items(\%itemcount);
}