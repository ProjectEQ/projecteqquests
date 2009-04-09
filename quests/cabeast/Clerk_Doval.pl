sub EVENT_SAY { 
if($text=~/what proposition/i){
quest::say("I was sent by the Legion to deliver a restraining order to a few of the troopers.  They have been ordered to stay away from the tavern.  They have spent too much time drinking and not enough training.  I am to have them initial the restraint order list. but my feet are killing me.  Perhaps you could [deliver the restraining order]?");
}
if($text=~/i want to deliver the restraining order/i){
quest::say("Here is the restraint order.  Go to the troopers and ask them to [sign the restraining order].   Also. make sure to have them sign it in alphabetical order.  I am a very big stickler about this.  The troopers' names are as follows; Ozlot. Ogmire. Nish Nish. Frogzin. Gummin. Inkin. Roklon. Taer. Fryp and Selbat.   When all is done. I shall pay you.");
}
if($text=~/i will deliver the restraining order/i){
quest::say("Here is the restraint order.  Go to the troopers and ask them to [sign the restraining order].   Also. make sure to have them sign it in alphabetical order.  I am a very big stickler about this.  The troopers' names are as follows; Ozlot. Ogmire. Nish Nish. Frogzin. Gummin. Inkin. Roklon. Taer. Fryp and Selbat.   When all is done. I shall pay you."); }
}
#END of FILE Zone:cabeast  ID:630 -- Clerk_Doval 

