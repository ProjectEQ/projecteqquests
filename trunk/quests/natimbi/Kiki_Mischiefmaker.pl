# Kiki's Turtle Soup
# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello hello! Quite a small camp isn't it? We must be very careful nowadays. There is some marvelous [soup] to be had however. I fear we are growing low, sooner or later someone is going to have to go out and catch some more of those strange local turtle type creatures. I think they have been labeled turepta."); 
  }
  if($text=~/soup/i) {
    quest::say("I knew you would do well around here from the moment I saw you! How helpful. You must be very careful when hunting these creatures, or the meat can become quite bruised and inedible. If you can bring me back four succulent meats I should be able to whip up enough soup for all of us that will last some time! If you are the casting sort you may enjoy my book, I would be happy to give you a copy for your trouble."); 
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 54066 => 4)) { #Succulent Turepta Meat
    quest::say("Marvelous! This should do just fine. I can't thank you enough! Here is a copy of my book."); 
    quest::exp(10000);
    quest::summonitem(54067); #Kiki's Recipe Book
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:natimbi ID: 280044 -- Kiki_Mischiefmaker.pl