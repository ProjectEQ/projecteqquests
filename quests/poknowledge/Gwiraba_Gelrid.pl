#Gwiraba_Gelrid.pl
#Advanced Combat Manual


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Good day to you, $name. By the looks of things you have learned quite a bit about planar combat already, but if you wish to be truly knowledgeable on the subject, there is one last course you must undertake. Using your newfound courage and bravery, you must collect for me a Sandstorm Gem, a Rage Filled Gem, and a Blue Diamond. Bring me these items along with your Intermediate Combat Manual. And remember, unless you have the moral nerve to live out your convictions, they are of little account.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22503 => 1, 26697 => 1, 	9421 => 1, 28790 => 1)) {#Blue Diamond, Rage Filled Gem, Sandstorm Gem, Intermediate Combat Manual
    quest::say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, $name!");
    quest::summonitem(28791); #Advanced Combat Manual
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#END of FILE Zone:poknowledge  ID:202042 -- Gwiraba_Gelrid 
