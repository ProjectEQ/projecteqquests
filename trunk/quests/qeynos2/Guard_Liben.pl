sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. $name.  Guard Liben at your service.  You can walk the streets of Qeynos and feel safe knowing that we guards are here to protect you.  Just be careful not to fall in with the [wrong crowd].");
}
if($text=~/wrong crowd/i){
quest::say("Oh you know. the Circle.  The Circle of Unseen Hands is what they call themselves.  They are a bunch of thieves and murderers.  Just stay clear of them. if you know what's good for you."); }
}
#END of FILE Zone:qeynos2  ID:2016 -- Guard_Liben 

