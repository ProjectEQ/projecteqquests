 ###########################################
## DEVELOPER: KOVOU
##
## *** NPC INFORMATION ***
##
## NAME: Greta Terrilon
## ID: 29036
## ZONE: halas
##
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You will have to excuse me. I am quite busy.");
  }
  if($text=~/some ink/i) {
    quest::say("Oh, sure. Here you go."); #Text made up
    quest::summonitem(12619); #Vial of Datura Ink
  }
}

sub EVENT_ITEM {
  quest::say("I do not need this.");
  plugin::return_items(\%itemcount);
}