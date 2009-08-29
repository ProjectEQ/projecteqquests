# Quest for Lodizal Shell Shield

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("What manner of creature are you, strange one? I can see that you are not native to any nearby territories. Your thin flesh and lack of hair would mean certain death when the ice queen breathes upon these seas.");
  }
  elsif ($text=~/lodizal/i) {
    quest::say("Lodizal is a giant carnivorous sea turtle that roams the iceclad ocean preying primarily on the Snowfang gnolls. The Snowfang gnolls are not trusted by we Othmir as they survive on the skins and meat of walrus and otter but Lodizal is a threat to all coastal dwellers. Should Lodizal ever be slain I would be willing to craft a shield from his shell and adorn it with Othmir runes. I would charge ten thousand gold for the service.");
  }
}

sub EVENT_ITEM {
  my $cash = $copper + $silver * 10 + $gold * 100 + $platinum * 1000;

  if (($cash >= 1000000) && plugin::check_handin(\%itemcount, 22815=> 1)) { #Check for 10000 gold
    quest::emote("skillfully crafts the section of Lodizal's shell into the shape of a shield. He then attaches sturdy cured walrus hide leather straps to the inner side of the shield and inscribes intricate glowing runes on the shield's face. When he is finished, he hands you the shield and claps loudly.");
    quest::summonitem(22816);
    quest::exp(150000);
    quest::faction(241, 30);
    quest::faction(345, -60);
  }
  else {
    if ($cash) {
      quest::say("Sorry stranger, but that is not enough to barter with.");
      quest::givecash($copper, $silver, $gold, $platinum);
    }
    plugin::return_items(\%itemcount);
  }
}