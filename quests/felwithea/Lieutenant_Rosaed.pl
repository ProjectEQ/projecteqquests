sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What are you doing up here?  This area is for the Koada'Vie only!  If you are not a [defender of Felwithe]. leave at once!!");
}
if($text=~/what defender of felwithe/i){
quest::say("All paladins who have been charged with the defense of Felwithe are called Defenders.");
}
if($text=~/i am a defender of felwithe/i){
quest::say("Hmmph!!  You are a little short to be a guard.  Let us get to work then.  There is much to do.  I have news of a [frightening development] of late.");
}
if($text=~/what frightening development/i){
quest::say("Felwithe weeps!! Our beautiful flower. Princess Lenya Thex. has been reported missing! Lord Tynkale says he is looking into the matter. but I fear he is taking far too long.  I have heard that a man named Tolon Nurbyte has been seen in the city lately.  He looks like a shady one.  I would seek him out for answers to her disappearance."); }
}
#END of FILE Zone:felwithea  ID:61029 -- Lieutenant_Rosaed 

