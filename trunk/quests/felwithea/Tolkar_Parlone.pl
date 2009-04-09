sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. good adventurer!  I am afraid that my services are not available at the moment.  I am too worried about my [daughter].");
}
if($text=~/who is your daughter/i){
quest::say("My daughter's name is Lenara.  I have not seen her in several months. and I fear the worst.  She went off adventuring. even though I told her how dangerous it was."); }
}
#END of FILE Zone:felwithea  ID:61017 -- Tolkar_Parlone 

