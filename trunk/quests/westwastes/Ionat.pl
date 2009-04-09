sub EVENT_SAY {
  if($text=~/Hail/i){
   quest::say("Hello $name. It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
 }
}

sub EVENT_ITEM {
  #Handin: Jualicn's Token
  if(plugin::check_handin(\%itemcount, 1908 => 1)){
   #Hsagra's Wrath
   quest::say("Take this Rune of Revenge, $name. You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause. It is good to have you amongst our ranks.");
   quest::faction(42,100); # +ClawsofVeeshan 
   quest::faction(362,100); # +Yelinak
   quest::faction(189,-1); # -Kromzek
   quest::exp(1000); 
   #Summon: Rune of Revenge
   quest::summonitem(1894);
   #Summon: Jualicn's Token
   quest::summonitem(1908);
  } 
  else {
   quest::say("I have no need for this item $name, you can have it back.");
   plugin::return_items(\%itemcount);
  }
}


#NpcID: 120017 - NpcName: Ionat - Zone: westwastes