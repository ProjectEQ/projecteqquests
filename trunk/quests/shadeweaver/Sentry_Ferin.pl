sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Your motivations for helping us are yet unknown.  There is much you can do to prove yourself, friend.");
}
if($text=~/I want to prove myself/i){
quest::say("You choose your enemies poorly!"); }
}
#END of FILE Zone:shadeweaver  ID:165148 -- Sentry_Ferin 

