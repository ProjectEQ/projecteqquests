#########################################################
# Trudo Frugrin (ID:57059)
# Zone:   Lesser Faydark (lfaydark)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################
# items: 13275

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("What. what?!! I am quite busy here. I have studies to complete and charts to make!");
   }
   if($text=~/lens/i){
      quest::say("Yes, of course. Here you are. Now be off.");
      quest::summonitem(13275); #telescope lens [trudo's lens]
   }
}

#END of FILE Zone:lfaydark  ID:57059 -- Trudo_Frugrin
