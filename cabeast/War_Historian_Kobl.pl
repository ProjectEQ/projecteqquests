sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You have come to learn. have you not?  I have knowledge of importance to young warriors of the legion.  Or perhaps you are a scribe seeking my [unique writing materials]!");
}
if($text=~/what unique writing materials/i){
quest::say("You must be a scribe of sorts?  Always glad to assist a talented youth.  I make two things unique to Cabilis and important to any future master scribe.  I can create [blood ink] and [illweed parchment].");
}
if($text=~/what blood ink/i){
quest::say("If blood ink is what you seek. then only I can provide it.  I use a unique blend prepared by my secret method.  I can supply you with a vial of blood ink. but first you must fetch me four ingredients.  I need globules of blood from certain creatures.  I need globules from the carnivorous plants. leeches and mosquitoes.  I also need globules from the blood pit of the Tower of Death.  Bring me these and be quick. or the blood will disintegrate.");
}
if($text=~/what illweed parchment/i){
quest::say("If you wish to obtain a page of my illweed parchment. you only have to perform a simple task.  Bring me four illweed reeds from the Lake of Ill Omen.  You may find that the only way one can find illweed is to go fishing."); }
}
#END of FILE Zone:cabeast  ID:5321 -- War_Historian_Kobl 

