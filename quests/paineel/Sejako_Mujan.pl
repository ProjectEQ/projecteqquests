sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Shhhh....keep your voice down lest you wake Alaria. We can [speak elsewhere] if you wish.");
}
if($text=~/lets speak elsewhere/i){
quest::say("Follow me and we shall discuss how you may assist me with my [current research].");
}
if($text=~/what current research/i){
quest::say("Recently patrols have been sent to the Stonebrunt Mountains to investigate rumors of an alliance between the Kejekans and Erudin. There is much spiritual activity in that region of Odus and the patrols have reported encountering massive beasts called Titans. These titans exhibit abilities that lead me to believe they are powerful animal spirits that have somehow taken on a physical form in order to enter and manipulate the realm of the living. I require [samples] of the Titans physiology in order to further my research.");
}
if($text=~/what samples/i){
quest::say("There have been sightings of Titans in many forms. The samples I require are the fangs of the leopard. sabretooth. and gorilla titans. and the rattle of the snake titan.");
}
if($text=~/I wish to speak elsewhere/i){
quest::say("Follow me and we shall discuss how you may assist me with my [current research].");
}
if($text=~/let us speak elsewhere/i){
quest::say("Follow me and we shall discuss how you may assist me with my [current research].");
}
if($text=~/where speak elsewhere/i){
quest::say("Follow me and we shall discuss how you may assist me with my [current research].");
}
if($text=~/where canw e speak elsewhere/i){
quest::say("Follow me and we shall discuss how you may assist me with my [current research]."); }
}
#END of FILE Zone:paineel  ID:75118 -- Sejako_Mujan 

