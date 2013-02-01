#Smith_Tv`ysa.pl
#Evil Research
#The xp from this quest was what made it worthwhile, more than the concordance. -Kilelen

sub EVENT_SAY {
	if($text =~/Hail/i) {
		quest::say("I am Tv`ysa, guardian of the [Concordance of Research].");
	}
	if($text =~/Concordance of Research/i) {
		quest::say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research', volumes I and II, help those who are [interested] in researching spells.");
	}
	if($text =~/interested/i) {
		quest::say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
	}
}
sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 10300 => 1)) {#Lightstone
    quest::say("A lightstone ? Thank you very much. Here is a copy of 'Runes and Research' for you.");
    quest::summonitem(quest::ChooseRandom(18175, 18176));#Runes and Research Volume I or II
    quest::faction(87, 10);#Dreadguard Inner
    quest::faction(88, 10);#Dreadguard Outer
    quest::faction(69, 10);#Dark Bargainers
    quest::exp(137200);#5% level 15 experience.
  }
  if(plugin::check_handin(\%itemcount, 10400 => 1)) {#Greater Lightstone
    quest::say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
    quest::summonitem(17504);#Concordance of Research
    quest::faction(87, 10);#Dreadguard Inner
    quest::faction(88, 10);#Dreadguard Outer
    quest::faction(69, 10);#Dark Bargainers
    quest::exp(274400);#10% level 15 experience.
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}#Done