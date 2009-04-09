sub EVENT_SAY {
  if($text=~/Hail/i){
   quest::say("Greetings, $name. I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
 }
}

sub EVENT_ITEM {
  #Handin: Jualicn's Token
  if(plugin::check_handin(\%itemcount, 1908 => 1)){
   #Hsagra's Wrath
   quest::say("Ah of course, $name. You will need a Rune of Eradication for your lexicon. We are counting on your loyalty. Remember that you will need to bring the teachings of Relinar to Lawyla for further instructions, as she requires them to pass on the magic to those worthy of it. I bid you farewell, $name.");
   quest::faction(42,100); # +ClawsofVeeshan 
   quest::faction(362,100); # +Yelinak
   quest::faction(189,-1); # -Kromzek
   quest::exp(1000); 
   #Summon: Rune of Eradication
   quest::summonitem(1893);
   #Summon: Jualicn's Token
   quest::summonitem(1908);
  } 
  else {
   quest::say("I have no need for this item $name, you can have it back.");
   plugin::return_items(\%itemcount);
  }
}


#NpcID: 120018 - NpcName: Entariz - Zone: westwastes