sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. stranger! Are you the [bounty hunter I requested]?");
}
if($text=~/i am the bounty hunter you requested/i){
quest::say("It is about time.  I have been waiting for you for ages!  Your [reputation] precedes you.");
}
if($text=~/what reputation/i){
quest::say("You humor me. Slaythe!  I would have guessed someone like yourself would have little time for humor.  Nevertheless. would you [like to hear about the job] I have for you?");
}
if($text=~/i would like to hear about the job/i){
quest::say("Your name is as respected as the name of the Karana bandits.  Leave my presence while you still have legs to run with.");
quest::say("A prisoner named Bronin Higginsbot. a halfling. recently escaped.  He was a small time thief and I would care less if it were not for the fact that in the process of obtaining the cell key. he disemboweled my finest guard.  We found the bloodied shank still stuck in my guard's gutted corpse.  Would you [like to know more]?");
}
if($text=~/i am the bounty hunter u requested/i){
quest::say("It is about time.  I have been waiting for you for ages!  Your [reputation] precedes you.");
}
if($text=~/i would like to know more/i){
quest::say("That little man has now made it to Rivervale.  He has ties with the halfling rogues. obviously. I want you to find him.  When you find him. take this shank he used to kill my guard and hand it to him.  I want him to know why he is about to die.  No one escapes my prison!!  Bring me his head and I shall pay the bounty.");
quest::summonitem("13110"); }
}
#END of FILE Zone:highkeep  ID:6042 -- Captain_Boshinko 

