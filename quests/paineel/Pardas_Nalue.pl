sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Oh. hello there. $name!  I have been absolutely slaving all day to choose a new [advertisement] for my wonderful store here.  Care to hear what I have?");
}
if($text=~/what advertisement?/i){
quest::say("Excellent!  Here goes.  Come to Pardas Nalue's Sinfully Handsome Tailor!  You can get everything you need to be just as good looking as Pardas.  Well. almost everything!  So. do you like it?");
}
if($text=~/Yes, I like it/i){
quest::say("I just knew you would!  Come on folks. let's watch the money just come pouring in!  Isn't this absolutely fabulous?!");
}
if($text=~/yes, its absolutely fabulous/i){
quest::say("I just knew you would!  Come on folks. let's watch the money just come pouring in!  Isn't this absolutely fabulous?!"); }
}
#END of FILE Zone:paineel  ID:75102 -- Pardas_Nalue 

