#############
#Quest Name: Research Aid
#Author: Blaz
#NPCs Involved: 1
#Items Involved: 3
#################
sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("I am Mrysila. custodian of the [Concordance of Research]."); 
}
if($text=~/Concordance of Research/i){

quest::say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research,' volumes I and II, help those who are [interested] in researching spells."); 
}
if($text=~/interested/i){

quest::say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research."); 
}
}

sub EVENT_ITEM {
#Lightstone turn in, reward is either Runes and Research Volume I or II
  if (plugin::check_handin(\%itemcount, 10300 => 1)) {
    quest::say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
    quest::exp(14500);
    $random = quest::ChooseRandom(18175,18176);
    quest::summonitem($random); #Runes and Research Volume I or Runes and Research Volume II
  }
#Greater lightstone turn in, reward is Concordance of Research
  elsif (plugin::check_handin(\%itemcount, 10400 => 1)) {
    quest::say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
    quest::exp(16000);
    quest::summonitem(17504); #Concordance of Research
  }
  else {
    quest::say("$name, I don't need this."); #text made up
    plugin::return_items(\%itemcount);
  }

}


#END of FILE Zone:northkarana  ID:13067 -- Mrysila