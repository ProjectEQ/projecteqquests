#Zalil_Nyvin.pl
#Advanced Magic Manual
# items: 22503, 26710, 9424, 28796, 28797


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("How do you do, $name? So you think you're skilled in the art of magic, do you? Pay close attention for this course I have for you will test your magical prowess like none before. In order to continue my work I will need for you to bring back a few things for me. When you can locate a Tornado Gem, a Battle Worn Trinket, and a Blue Diamond, return and hand them to me along with your Intermediate Magic Manual. If you can do this, then perhaps maybe there is a shred of hope left for you after all! Be off now and good luck!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22503 => 1, 26710 => 1, 	9424 => 1, 28796 => 1)) {#Blue Diamond, Battle Worn Trinket, Tornado Gem, Intermediate Magic Manual
    quest::say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, $name!");#Stole Text from Advanced Combat Manual quest, I have no other reference
    quest::summonitem(28797); #Advanced Magic Manual
  }
  plugin::return_items(\%itemcount);    
}#END of FILE Zone:poknowledge  ID:202037 -- Zalil_Nyvin 

