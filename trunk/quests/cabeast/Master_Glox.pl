#This killable version of Grand Master Glox is part of the Test of Agility, for the Whistling Fists quest line. Please see Grand Master Glox's file in this zone for more details.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("That took you long enough. Well then, are you ready to prove your agility to me?");
  }
}

sub EVENT_DEATH {
 quest::say("You have come into your own. Spread the pain you have shown me to all of your foes.");
}

#Submitted by Jim Mills