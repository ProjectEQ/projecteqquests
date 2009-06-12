sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Halt. who goes there? Hmmm. What manner of strangers are you?  Let it be known that the Kin hold no love for outsiders. only those truly worthy may walk amongst the Kin.");
quest::say("Halt. who goes there? Hmmm. What manner of strangers are you?  Let it be known that the Kin hold no love for outsiders. only those truly worthy may walk amongst the Kin.");
quest::say("Be quick for the Guardians may not appreciate you leaving your post."); }
}
sub EVENT_ITEM{
if($itemcount{29062} == 1){
quest::say("Very good. you are on your way to proving yourself");
quest::say("Very good. you are on your way to proving yourself.");
quest::faction("332","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
}
if($itemcount{29062} == 4){
quest::say("Very good. you are on your way to proving yourself");
quest::say("Very good. you are on your way to proving yourself.");
quest::faction("332","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
}
if($itemcount{29624} == 1){
quest::say("Ahhh yes! Well done Erudite. Here is your reward. Your status with our people grows with each interloper you eradicate.");
quest::givecash("13","6","6","0");
quest::faction("332","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
}
if($itemcount{29062} == 2){
quest::say("Very good. you are on your way to proving yourself.");
quest::faction("332","1");
quest::faction("Not_Found","1");
quest::faction("336","-1");
}
if($itemcount{29062} == 3){
quest::say("Very good. you are on your way to proving yourself.");
quest::faction("332","1");
quest::faction("Not_Found","1");
quest::faction("336","-1"); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Kcor 



sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hello. $name. I would be careful around the cubes.  Rumor is they've gotten some kind of intelligence now."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Anex 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I would be careful wandering the maze.  Many have gotten lost and never come out the other end."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Drahs 


sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I've seen your kind dashing about.  Just watch your footing. you never know when you might slip and fall."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Kaop 

