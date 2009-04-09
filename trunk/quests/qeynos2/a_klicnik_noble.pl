sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Dare you Hail me, futile $race !! Begone!");
quest::attack($char); }
}


