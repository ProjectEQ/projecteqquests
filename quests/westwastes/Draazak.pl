sub EVENT_SAY {
  if($text=~/Hail/i){
   quest::say("Greetings, $name. It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
 }
}

sub EVENT_ITEM {
  #Handin: Jualicn's Token
  if(plugin::check_handin(\%itemcount, 1908 => 1)){
   #Hsagra's Wrath
   quest::say("$name, whom Relinar found to be necessary for the success of the magic against those foul giants. I present this Rune of Concentration to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions.");
   quest::faction(42,100); # +ClawsofVeeshan 
   quest::faction(362,100); # +Yelinak
   quest::faction(189,-1); # -Kromzek
   quest::exp(1000); 
   #Summon: Rune of Concentration
   quest::summonitem(1896);
   #Summon: Jualicn's Token
   quest::summonitem(1908);
  } 
  else {
   quest::say("I have no need for this item, $name, you can have it back.");
   plugin::return_items(\%itemcount);
  }
}


#NpcID: 120019 - NpcName: Draazak - Zone: westwastes