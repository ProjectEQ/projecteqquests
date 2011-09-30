sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I'm afraid I can't speak right now, $name. I'm waiting for someone very important to arrive."); }
}
