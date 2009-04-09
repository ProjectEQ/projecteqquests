# Bregna's Big Mistake


sub EVENT_SAY {

   if($text=~/hail/i){
   
   quest::say("'Ah, so many dead to destroy, so little time. What is it you want? You seek the [potions] perhaps?");
   }

   if ($text=~/potions/i){

   quest::say("Give me the four clues.");

   }
   
   
}

sub EVENT_ITEM {


   if(plugin::check_handin(\%itemcount,18651 => 1,18652 => 1 ,18653 =>1 ,18654 =>1 )){ # Bregna's Big Mistake

      quest::summonitem(13984);
      quest::exp(100);
      
}
plugin::return_items(\%itemcount); # return unused item

 }
#END of FILE Zone:grobb  ID:52023 -- Bregna