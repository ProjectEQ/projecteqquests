sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hello. $name. what brings you to these sacred quarters on this day? If it is treasure that you seek please ask someone else for I do not have time to think of such petty things. My worries are much greater at this time I am afraid."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Ralgyn 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hello. Wood Elf. did you know Lord Yelinak has built a maze to protect the upper levels of the towers from invasion.  Keep that in mind when traveling through the shrine."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Telnaq 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Move along."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Iglotn 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I'd watch out for the cubes.  They've been getting hostile lately."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Maof 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("We were created to protect the Kin and the shrine from attack.  This is what we've always done.  Do not try to alter this."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Guardian_Elgoyr 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("I have no time to talk right now.  I must keep watch for hostiles."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Nalox 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("There are many places for the likes of you.  Why don't you go find one right now and leave me alone."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Guardian_Olgax 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("It is most unfortunate that you do not have scales to defend your fragile mortal shell. Wood Elf. I can only hope that the armor we in the Shrine can provide you with will extend your life another fraction of a century. In addition to that you also might want a [special helm] to cover up that scaleless face of yours. I understand that the Mother could not grace you with all our blessings. but at least we can try to make you look half way decent.");
}
if($text=~/what special helm/i){
quest::say("Using my obviously superior skills I can customize a plate helm from the Shrine to suit a Wood Elf such as yourself. Give me your Blood Lord's Crown. Scaled Knight's Helm. Helm of Twilight. Akkirus' Crown of the Risen. Cowl of Mortality. Frostreaver's Velium Crown. Crown of the Kromzek Kings. or Crown of the Myrmidon and I shall make you a new helm that will better hide and protect your unscaled features."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Supreme_Laochsmith_Psorin 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Don't mind the velium in next room.  They are too caught up in their duty to pay attention to anything else."); }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Sentry_Zalgoty 

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

