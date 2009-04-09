sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. stranger.  Are you an adventurer?");
}
if($text=~/i am an adventurer/i){
quest::say("I wish I could go off and explore the world like you.  I will spend my days as a fisherman here. I am sure.  Nothing ever happens around here though.  Well. except for the other day..");
}
if($text=~/what other day/i){
quest::say("I was spearfishing near the aviak construction and something amazing happened.  I was in the middle of spearing a fish when something at the bottom of the lake began to glow red.  I could swear I heard the sounds of a dragon. I did not stick around to find out what it was."); }
}
#END of FILE Zone:lakerathe  ID:51061 -- Rondel 

