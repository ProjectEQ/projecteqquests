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
quest::say("Greetings. traveler. I'm the keeper of possessions for the Skyshrine.  Any friend of the shrine can safely store their belongings with me."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Pyrox 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("There is rumor that a young N`Ogard is lost in the maze.  Perhaps you should go find the father and see if you can help."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Wegylx 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Yes? Can't you see we are busy here."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Suez 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Watch out in the water.  Yelinak keeps a few small fish there."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Jaylorx 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Ah. welcome stranger. Perhaps I could interest you in one of my famous Boysenberry pies. the delight of Sky Shrine");
quest::say("Why would I admit to such a lie? Everyone loves my pies. I rarely see anyone come in here asking for your Roasted Walrus.");
quest::say("Please ignore my friend Ruru here. He is a bit delusional."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Grudash_the_Baker 

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
quest::say("Hey there stranger. Pleased to meet you. I'm Ruru. I do the cooking around here. I'm the best cook around these parts. So. If you get hungry. you'd best be making sure you're coming to see me."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Ruru_the_Cook 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I've seen your kind dashing about.  Just watch your footing. you never know when you might slip and fall."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Kaop 

