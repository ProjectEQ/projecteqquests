sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("groans in extreme anguish. '[Help] me.'");
}
if($text=~/what help/i){
quest::say("My resting grounds have been desecrated. I now lie awake unable to rest with my fellow brethren. My soul is bound to this area for all of eternity. Until my [belongings] are brought back I cannot rest.");
}
if($text=~/what belongings/i){
quest::say("Many different things were taken. but I'm mainly concerned with my [amulet] and my family's crescent symbol. Bring these articles back into my possession and I'll return back to my state of rest.");
}
if($text=~/what amulet/i){
quest::say("The amulet was given to me after passing the Trials many many generations ago. It is a part of every soldier who has passed the trials. it is a part of my very being."); }
}
#END of FILE Zone:povalor  ID:208067 -- A_Wandering_Spirit 

