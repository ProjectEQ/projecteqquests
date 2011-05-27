#############
#Quest Name: Murder of Hurrietta
#Author: ?? (Update by BWStripes)
#NPC's Involved: 1
#Items involved: 1
#############
###NPC 1
#Name: Ton_Firepride
#Race 1 (Human), Texture of 1, Size 0, gender of 0
#Location XYZ: 89.2, -161.0, 3.8 in South Qeynos
#Level: 3
#Type: Quest NPC
#Reward: itemid 13134: Hurrieta's Bloody Dress
#############
###Item 1
#Name: Hurrieta's Tunic
#ID: 13129
#Quest Item
###

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, adventurer!  A mighty warrior such as yourself deserves only the finest in armor and we here at Firepride's were trained by the finest dwarven smiths.  We shall be branching out and crafting [other items] soon, also.");
  }
  if ($text=~/tax collection/i) {
    quest::say("Oh I see, Vicus has got some other sap to do his work. Fine. Here are your stinking taxes. If Kane were in charge, things would be different around here.");
    quest::faction( 53, -10);
    quest::summonitem(13170);
  }
  if($text=~/other items/i){
    quest::say("Ah, such interest! We have yet to finalise our inventory before we branch out - check back with us later."); #Improvised text
  }
}

sub EVENT_ITEM {
  if($itemcount{13129} == 1){
    my $ironpride_randomSP = int(rand(8));
    quest::say("Ha! This is great. Here's your money, murderer! Hope the guards don't find you. Now get lost! Take the tunic. Maybe Garuc will reward you for such a vile deed. I sure don't want to keep it around here.");
    quest::summonitem("13134"); #Hurrieta's Bloody Dress
    quest::givecash("5","$ironpride_randomSP","0","0");# Random from 8sp
    quest::faction("135","-5"); #Guards of Qeynos
    quest::faction("9","-5"); #Antonius Bayle
    quest::faction("53","4"); #Corrupt Qeynos Guards
    quest::faction("33","4"); #Circle Of Unseen Hands
    quest::faction("217","-5"); #Merchants of Qeynos
    quest::exp("400");
  }
}

#END of FILE Zone:qeynos  ID:1127 -- Ton_Firepride

