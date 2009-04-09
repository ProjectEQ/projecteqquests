sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name.  I have a little time to chat. we are not due in the [field] for a while.  What may I help you with?");
}
if($text=~/what field/i){
quest::say("The Glassy Wastelands.  We work hard to keep the [plight] back from the rest of the Forest. but I fear that is a losing battle.");
}
if($text=~/what plight/i){
quest::say("I am afraid that I am not at liberty to go into depth. even with the little that we know.  What I can tell you is that the Wasteland is dangerous; the glass manages to hide terrors that few men outside these walls could bear to speak of. much less see.  If you choose to journey know that we will offer you little protection."); }
}
#END of FILE Zone:povalor  ID:208060 -- Sergeant_Lusahn_Matthers 

