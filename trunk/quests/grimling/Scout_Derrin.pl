sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name, what brings you to the battlegrounds? Looking to raid a grimling camp perhaps?");
}
if($text=~/i am looking to raid a grimling camp/i){
quest::say("I can lead a dozen men of my strength on a raid against a well fortified grimling encampment. It's a risky mission, but one that has the potential to yield substantial rewards. If you have the manpower and the courage, give me a glowing acrylia sphere and we'll get started.");
}
if($text=~/i am looking to raid/i){
quest::say("I can lead a dozen men of my strength on a raid against a well fortified grimling encampment. It's a risky mission, but one that has the potential to yield substantial rewards. If you have the manpower and the courage, give me a glowing acrylia sphere and we'll get started."); }
}
#END of FILE Zone:grimling  ID:167132 -- Scout_Derrin 

