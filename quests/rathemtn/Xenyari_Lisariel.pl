#########################################################
# Xenyari_Lisariel (ID:50271)
# Zone:   Rathe Mountains (rathemtn)
# Quest:  The Etched Stone
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("Hello, $name. Oh, I wish I had a prickly pear. I just have this insatiable craving for a prickly pear. But Permafrost is just so far! <Sigh.>");
   }
   if($text=~/prickly pear/i){
      quest::say("Yes, yes! Prickly pears! Do you have any? I just love prickly pears but Permafrost is just so far away even for us druids.");
   }
}

############################################################
#Handin
#     10195 : Prickly Pear (from 13th floor)
#Reward
#     10196 : Bloodied piece of Parchment (from 13th floor)
############################################################
#Handin
#     10193 : Faceted Hyacinth Telesm (from 13th floor)
#Reward
#     10194 : Pulsating Hyacinth Telesm
#     Xenyari vanishes
############################################################

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,10195=>1)) {
      quest::say("Prickly pears! I just love prickly pears!! Thank you so much for getting these for me. I really, really appreciate your gift and I shall not.. OWW!! I hate it when I stick myself with the needles! Oh look, I am bleeding now! <Sigh.> Can you hold this note for a moment, please? My hands are full and I must clean up.");
      quest::summonitem(10196);
      quest::exp(1000);
   }
   elsif (plugin::check_handin(\%itemcount,10193=>1)) {
      quest::emote("bounces around with glee at the sight of your gift, smiles at you, and dons the telesm. As she clasps the telesm around her neck, she begins to writhe in agony, and slowly fades from sight leaving just the telesm, which is now pulsating with vibrant energy.");
      quest::depop();
      quest::summonitem(10194);
      quest::exp(10000);
   } else {
     plugin::return_items(\%itemcount);
     quest::say("I don't need that, friend.");
   }
}

#END of FILE Zone:rathemtn  ID:50271 -- Xenyari_Lisariel 