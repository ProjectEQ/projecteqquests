#Merging from Not_Found.pl
#
# items: 29062, 29624

sub EVENT_SAY {
  if($text=~/hail/i) {
    if($faction < 4) {
      quest::say("Be quick for the Guardians may not appreciate you leaving your post.");
    }
    else {
      quest::say("Halt, who goes there? Hmmm. What manner of strangers are you? Let it be known that the Kin hold no love for outsiders, only those truly worthy may walk amongst the Kin.");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29062 => 1)) { #Giant Warrior Helmet
    quest::say("Very good, you are on your way to proving yourself.");
    quest::faction(430,5);   #CoV
    quest::faction(436,5);  #Yelinak
    quest::faction(448,-5); #Kromzek
  }
  if(plugin::check_handin(\%itemcount, 29624 => 1)) { #Mercenary Assignments
    quest::say("Ahhh yes! Well done $class. Here is your reward. Your status with our people grows with each interloper you eradicate.");
    quest::givecash(13,6,6,0); #Copper x 13, Silver x 6, Gold x 6
    quest::faction(430,5);   #CoV
    quest::faction(436,5);  #Yelinak
    quest::faction(448,-5); #Kromzek
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Kcor
