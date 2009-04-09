#Digmaster_Duggert.pl
#Revenge for Duggert


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("I am certainly lucky to be alive this day hail and well met. The goblins in the Temple of Droga have been a constant thorn in my peoples side and we need to strike back at them. Will you help us strike back?");
  }
  if($text=~/strike back/i) {
    quest::say("I am glad you will help. Here is what I need for you to do for me. Find the goblin dust hoodlums within the depths of the Temple of Droga and bring back three Hoodlum Symbols of Dust they often have. Also seek out the famous thief, Dust Hoodlum Heaprit, and bring back his heart so I might use it in a ritual of protection. If you do this for me I will reward you well.");
  }
}  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 62100 => 3, 62101 => 1)) {#3x Hoodlum Symbol of Dust  ,Heaprit's Heart
    quest::say("May the blessing of the earth be with you. Here take this, it may prove useful to you.");#Text borrowed from another in same line of quests
    quest::summonitem(62206); #Antique Ring of Truth
    quest::exp(6987750);#2% of level 56 xp, quest intended for level 55 characters
  }
  
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#Done