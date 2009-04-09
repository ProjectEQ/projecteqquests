#Friaz_Ompir  ID 155060

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18321 =>1 )) {
    quest::say("Ahhh... I see that Noril is trying to get out of work. That lad is a lazy one. Not a problem though... you'll do all the same. Here, let me add a few more things to that list, since you look nice and strong. Take this list and my grocery bag and I'll see about scrounging up the beetle horns that Noril's been bugging me about.");
    quest::summonitem(18322);
    quest::summonitem(17606);
  }

if (plugin::check_handin(\%itemcount, 5548 =>1 )) {
  quest::say("I thank you, $name. I should make Noril come get these horns himself, but I guess that I can understand what it feels like to be too busy to get everything done. You've been a great help to me today. Give these horns to Noril and tell him that I thank him for your assistance. Take care, young one.");
  quest::summonitem(5549);
}
}
