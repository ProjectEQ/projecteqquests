 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Jinkus Felligan
## ID: 29023
## ZONE: halas
##
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice], then, eh?");
  }
  if($text=~/new to the shamans/i) {
    quest::say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye willing to [contribute to our church] or did ye just come to meditate within our walls?");
  }
  if($text=~/contribute/i) {
    quest::say("Well then, ye best be off ta find Holana Oleary, she organises our monthly Karan Clover shipments, just tell her Jinkus sent you to assist her. Or, I can have you [make a delivery] for me."); #made up text
  }
  if($text=~/make a delivery/i) {
    quest::say("Excellent! First, visit Cindl and tell er ye need a Mammoth Hide Parchment. Then, I need ye to visit Greta and tell her you need some ink. Bring these back to me and we will continue from there.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12621 => 1, 12619 => 1)) { #Mammoth Hide Parchment, Vial of Datura Ink
    quest::say("Good, now you must take this wanted poster i made to Guard Eracon Krengon in Southern Qeynos. Bring me back the Most Wanted List...");
    quest::summonitem(12620); #Wanted Poster
  }
  if(plugin::check_handin(\%itemcount, 12622 => 1)) { #List of Qeynos Most Wanted
    quest::say("Fantastic, Fantastic... Here you have more than proven your right to wear this. Use it wisely...");
    quest::summonitem(1376); #Initiate Symbol of the Tribunal
    quest::facetion(15,2);  #Banker
    quest::faction(213,2);  #Merchants of Halas
    quest::faction(294,2);  #Shamen of Justice
    quest::faction(33,-3);  #Circle of Unseen Hands
    quest::faction(48,-3);  #Coalition of Tradefolk Underground
    quest::faction(137,-3); #Hall of the Ebon Mask
  }
  plugin::return_items(\%itemcount);
}