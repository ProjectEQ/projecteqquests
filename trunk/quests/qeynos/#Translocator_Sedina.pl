sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [travel to] Erud's [Crossing] in the meantime, I can transport you to my companion there."); 
}
if($text=~/travel to crossing/i){
quest::selfcast("2289"); }
}
 

