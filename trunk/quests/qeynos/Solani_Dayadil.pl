sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("If you are a fellow merchant. I must warn you of the inevitable tax increase.  Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
}
if($text=~/what deal/i){
quest::say("Bayle is soon to sign a law which will raise the taxes on all bear hides.  This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!"); }
}
#END of FILE Zone:qeynos  ID:1102 -- Solani_Dayadil 

