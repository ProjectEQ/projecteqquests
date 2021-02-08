# items: 17044, 12914, 18074, 12408, 12614
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings!! You look like an adventurer. I have a bit of a problem with which you might be able to help. You see, there have been reports of sarnak hatchlings near the lake. I do not know why they are here, but I do know we need them exterminated. Here is the deal.. You bash them good and return their brains to me. For every four brains, I shall reward you.");
  }
  if ($text=~/trooper reporting for duty/i) {
    quest::say("Very good to have you on board, Trooper $name! We have had reports of sarnak legionnaires attacking caravans. I shall require you to find these sarnak legionnaires. Take this pack. Fill and combine it with as many of their brains as sill fit inside. Return the full pack to me and I shall consider you for a promotion.");
    quest::summonitem(17044); # Item: Lake Garrison Pack
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12914 =>1 )) {
    quest::say("Very good. I cannot see any reason a warrior like you should waste their time on the patrols of a trooper. I shall recommend you for a promotion. I hope the War Baron agrees.");
    quest::ding();
    quest::exp(2000);
    quest::summonitem(18074); # Item: Legionnaire Recommendation
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
  }
  if (plugin::check_handin(\%itemcount, 12408 =>4 )) { 
    quest::say("Bravo!! You have done well. Here is a small reward. The greater reward is service to the empire.");
    quest::ding();
    quest::exp(3000);
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
    quest::givecash(0,0,1,0);
    quest::summonitem(12614); # Item: Dried Froglok Leg
  }
  plugin::return_items(\%itemcount);
}
