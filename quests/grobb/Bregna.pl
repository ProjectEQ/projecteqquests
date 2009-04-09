# Bregna's Big Mistake
# Aid Garuuk


sub EVENT_SAY {

   if($text=~/hail/i){
   
   quest::say("Me says hi to you. What you want from me? Oh!! Me shaman trainer. You must be shaman. Are you [shaman Darkone]?");
   }

   if ($text=~/shaman darkone/i){

   quest::say("You choose rite if you bes a shaman. We's da best. You remember ta not get in Kaglari way. She get mad berry easy. She gets berry mad at Bregna if she finds out me make [big mistake].");

   }

   if ($text=~/big mistake/i){

   quest::say("Kaglari make me do the tasks for her. She tolds me to take crate of speshal poshuns to sumwun in Nektoolos forust. But I make mistake. I fall asleep under da trees becuz I was so tired. I wake up and poshuns are gone! Sumwun take the poshuns frum me. Dey leave dis note wit me. Me tinks dey play trick on me. Me tinks it be da stinkin' Halflings. Me needs ta gets dem back before Kaglari find out. I need sumwun to help me [find da poshuns].");
   
   }
   
   if ($text=~/find da poshuns/i){
   
   quest::say("Take dis as it be all me know.");
   
   quest::summonitem(18651);
   
   }
   
   
}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,13984 => 1)){ # Bregna's Big Mistake
   
      quest::say("Now Kaglari won't be mad at Bregna.");
      quest::summonitem(12212);
      quest::exp(100);

   
}
   if(plugin::check_handin(\%itemcount,26632 => 1,26640 => 1 ,29921 =>1 ,26662 =>1 )){ # Aid Garuuk
   
      quest::say("Ere. take dis back to Garuuk, K.");
      quest::summonitem(28740);
      quest::exp(10000);
      
}
plugin::return_items(\%itemcount); # return unused items


   }

#END of FILE Zone:grobb  ID:52023 -- Bregna