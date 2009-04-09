sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("May the power of Underfoot be with you.  Welcome.  I am here to serve the will of the king as should you.  If you [need healing]. then speak.  Or perhaps you are here to [return skunk glands]?");
}
if($text=~/i need healing/i){
quest::say("Before the power of Underfoot can attempt to bind your wounds you must pay tribute.  Three gold coins!!");
}
if($text=~/i want to return skunk glands/i){
quest::say("I have made an offer to all clerics of this cathedral.  I shall reward one cleric scroll from our scribes for the return of four skunk scent glands.  This offer is best left to our clerics."); }
}
#END of FILE Zone:kaladimb  ID:67023 -- Nultal_Malfoot 

