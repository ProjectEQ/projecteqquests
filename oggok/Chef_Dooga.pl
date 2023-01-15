# items: 13384, 21964, 21962, 21968, 13452, 12217
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome you. You look all skin 'n bones. Eat you must do. Chef Dooga can fix up goodies for you. Try [HEHE meat].");
  }
  if ($text=~/hehe meat/i) {
    quest::say("It is a secret ground meat made with high elf, human, and Erudite Flesh. Mmmm. It good stuff. Dooga make it and [the Gobbler] make it. If you find any of those meats in the swamps bring to me and I pay you.");
  }
  if ($text=~/gobbler/i) {
    quest::say("You no hear of the Gobbler!! Him great butcher. Have all kinds of meat. Him am low on froglok legs. Dooga supply him. Dooga need someone to [deliver froglok legs].");
  }
  if ($text=~/froglok legs/i) {
    quest::say("You think so!! That be good thing. Make the Gobbler happy. Maybe he give you something good. Maybe not. You take this. Deliver meat.");
    quest::summonitem(13384); # Item: Preserved Leg
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21964 => 1, 21962 => 1, 21968 => 1  )) { #High elf, Erudite, and Human meat(Used human parts instead)
    quest::say("MmmmMmm. Human make good meat pies. Here. A little coins for you.");
    quest::ding();
    quest::exp(1000);
    quest::faction(228,10); #Clurg
    quest::faction(232,10); #Craknek Warriors
    quest::faction(261,10); #Green Blood Knights
    quest::faction(337,10); #Oggok Gaurds
    quest::faction(274,-15); #Kazon Stormhammer
    quest::givecash(0,3,6,9);
  }
  elsif (plugin::check_handin(\%itemcount, 13452 => 3)) {
    quest::say("Eww icky frogs. Me promise to give you reward, here yous go."); #Not actual text
    quest::summonitem(12217); # Item: Ogre Butcher Apron
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49061 -- Chef_Dooga
