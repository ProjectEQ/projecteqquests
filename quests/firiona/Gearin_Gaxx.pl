sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. friend!  If armor is what you seek. let the house of Gaxx provide you with the finest.  Our metalwork is second to none.  Every now and again we may even create [rare armor] for the general public to purchase.");
}
if($text=~/what rare armor?/i){
quest::say("I have found many exotic materials in Kunark with which I can create rare armor.  I currently am working on the [Guard of Ik] and the [Hate Tail Guard] shields.  I have no armor as of yet. but I am experimenting with new designs.");
}
if($text=~/what is the Guard of Ik/i){
quest::say("The Guards of Ik are made from shields found in the jungles.  I would be selling them if it were not for the unfortunate fact that the shields are spectral and vanish overnight.  Another bit of bad news is that the formula I was working on to stabilize the essence of the metal was stolen by local pirates.  I need two more shields and my formula.  Bring these to me and I shall not charge you."); }
}
#END of FILE Zone:firiona  ID:84185 -- Gearin_Gaxx 

