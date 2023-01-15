#############
#Quest Name:Turnin NPC for one Armor Task given by Castlen Drewe
#Author: Domel
#NPCs Involved: 2 [Castlen Drewe(202294) and Audri Deepfacet(202069)]
#Items Involved: 1 Permafrost Crystals(22121)
#################
# items: 22121

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. traveler. and welcome to New Tanaan. You will find that there is much to be gained in the way of knowledge here. Knowledge not only of the mind. but of skill. I am an adept jeweler and have offered my services to the city to repay its gracious host to me over the years. Please. feel free to search my inventory and purchase that which you might fancy."); }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22121 => 1)) {#Permafrost crystal
    quest::say("It is so lovely, just as I saw before! I believe I can fashion something quite nice for you out of it. I need only a chip to study for myself. Thanks so much! ");
  }
}

#END of FILE Zone:poknowledge  ID:202069 -- Audri_Deepfacet