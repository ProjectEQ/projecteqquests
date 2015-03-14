#Ethoach_Trokith.pl
#Advanced Stealth Manual


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Good day, $name. It would appear you have learned much about the art of stealth already, and this is good. Are you ready to learn more? If so, listen closely. To graduate to the next level of precision and cunning you need to discover a few items. Bring forth a Blizzard Gem, a Symbol of the Diaku, a Blue Diamond, and your Intermediate Stealth Manual. I feel this will be an adequate test of your skill at this stage in your development. Good luck!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22503 => 1, 9423 => 1, 26709 => 1, 28793 => 1)) {#Blue Diamond, Blizzard Gem, Symbol of the Diaku, Intermediate Stealth Manual
    quest::say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, $name!");#Stole Text from Advanced Combat Manual quest, I have no other reference
    quest::summonitem(28794); #Advanced Stealth Manual
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202047 -- Ethoach_Trokith 

