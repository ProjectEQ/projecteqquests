#Alex_McDarnin, Firiona Vie

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hail! Do you by chance bring news from the North? I sure do miss the cold. It is just a bit too warm for me down here. Well, I wish you the best of luck in your travels. Tomorrow is a new day and I am off in search of [new writings] to take back to the Tribunal.");
  }
  if($text=~/new writings/i) {
    quest::say("There have been tales of new writings being found in some of the ancient ruins that abound outside of this outpost. These writings will be very valuable to my church. The sooner I can return with the writings, the sooner the Tribunal can put the teachings to work. I am always in need of aides so if [you want to help], just say so.");
  }
  if($text=~/I want to help/i) {
    quest::say("We won't be traveling together, but here is what I need. There are four writings that still elude me. Return one of these and I'll spare one of the four extra writings I have. I am looking for the writings called Talisman of Jasinth, Spirit of Scale, Cripple, and Cannibalize III. Be off, and may your travels be safe!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 19269 => 1) || # Cripple
     plugin::check_handin(\%itemcount, 19238 => 1) || # Spirit of Scale
     plugin::check_handin(\%itemcount, 19264 => 1) || # Talisman of Jasinth
     plugin::check_handin(\%itemcount, 19272 => 1)) { # Cannibalize III
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
    quest::summonitem(quest::ChooseRandom(19267,19271,19274,19266));
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84173 -- Alex McDarnin