sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hello, I be Vin the Exterminator. I am here to get rid of these darn rodents that are plaguing our town. If ya would like to make a small bit of coin, perhaps you could help me. Hunt down some rodents and bring me four of their whiskers.  If yer not too busy, that is.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13071 => 4)){
    quest::say("Ah ya have returned. Nice work. You might consider a career in vermin extermination yourself!");
    quest::faction(314,5);
    quest::faction(169,5);
    quest::faction(219,5);
    quest::faction(215,5);
    quest::faction(57,-5);
    quest::givecash(1,1,1,0);
  }
}
#Submitted by Senzo : PEQ Quest Team