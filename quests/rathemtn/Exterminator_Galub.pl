sub EVENT_SAY {
 if($text=~/hail/i){ 
  quest::say("Welcome to Gukta. I am afraid I do not have much time to talk, my friend. Recently, the jungle hatchling population has gotten way out of control around here. I was brought in to try to curb their numbers but there are too many! Perhaps you could be of assistance to me. If you have time, kill some of the hatchlings and bring me four of their eyes. I will reward you of course.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 13253 => 4)){
  quest::say("Thank you for your help! But I must go, as you can see there are still many spiders for me to exterminate!");
  quest::faction(264,10);  
  quest::exp(5);
  quest::givecash(1,1,1,0);
 }
}