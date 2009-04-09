#zone: gunthak NPC: Muxzog_Gradok (224204)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("Yuz should go back where yuz came from. Muxzog would but have important tasks to do to help.");
 }
}